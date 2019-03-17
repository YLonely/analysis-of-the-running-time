import time
import numpy as np
import random
import subprocess
import shutil
import os
import io
import sys
# global size unit: MB


class Recorder:
    def __init__(self, lower_layer_size_range, total_step, file_split_range):
        self.lower_layer_size_base = lower_layer_size_range[0]
        self.file_split_size_base = file_split_range[0]
        self.map = np.zeros(
            [lower_layer_size_range[-1]-lower_layer_size_range[0] + 1,
             total_step+1, file_split_range[-1]-file_split_range[0]+1], dtype=np.float)

    def set(self, layer_num, step_num, file_split_num, value):
        self.map[layer_num-self.lower_layer_size_base, step_num -
                 1, file_split_num-self.file_split_size_base] = value

    def get(self, layer_num, step_num, file_split_num):
        return self.map[layer_num-self.lower_layer_size_base, step_num-1, file_split_num-self.file_split_size_base]

    def to_file(self, file_path):
        for i in range(self.map.shape[2]):
            np.savetxt(
                file_path+"/split_index_{0}.txt".format(i+1), self.map[:][:][i])


def create_file(filename, size):
    # the unit of size is MB
    command = "truncate -s {0}M {1}"
    subprocess.call(command.format(size, filename), shell=True)


def dir_init(layer_size):
    for layer_index in range(1, layer_size+1):
        if os.path.exists("./dir"+str(layer_index)):
            shutil.rmtree("./dir"+str(layer_index))
        os.makedirs("./dir"+str(layer_index))


def file_init(layer_size, file_size, file_split, is_random):
    if file_split == 0:
        part_file_size = file_size
    else:
        part_file_size = int(file_size/file_split)
    for layer_index in range(1, layer_size+1):
        if not os.path.exists("./dir"+str(layer_index)):
            raise RuntimeError("./dir"+str(layer_index)+" not exists.")
        for file_part in range(file_split):
            file_index_record = []
            if is_random:
                index = random.randint(1, 200)
                while index in file_index_record:
                    index = random.randint(1, 200)
                file_index_record.append(index)
                create_file(
                    "./dir{0}/part_{1}.bin".format(layer_index, index), part_file_size)
            else:
                create_file(
                    "./dir{0}/part_{1}.bin".format(layer_index, file_part+1), part_file_size)


def env_init(layer_size, file_size, file_split, is_random):
    if not os.path.exists("./work"):
        os.makedirs("./work")
    if not os.path.exists("./upper"):
        os.makedirs("./upper")
    if os.path.exists("./merge"):
        try:
            subprocess.call("umount -l merge", shell=True)
        except:
            pass
    else:
        os.makedirs("./merge")
    dir_init(layer_size)
    file_init(layer_size, file_size, file_split, is_random)


def evaluate_overlay(lower_layer_size_range, file_split_range, start_file_size, step_size, total_step, is_random=False):
    command = "mount -t overlay overlay -o lowerdir={0},upperdir=upper,workdir=work merge"
    recorder = Recorder(lower_layer_size_range, total_step, file_split_range)
    for file_split_num in range(file_split_range[0], file_split_range[-1]+1):
        for layer_num in range(lower_layer_size_range[0], lower_layer_size_range[-1]+1):
            for step_num in range(total_step+1):
                file_size = start_file_size+step_num*step_size
                env_init(layer_num, file_size, file_split_num, is_random)
                lowerdir = "dir1"
                for i in range(2, layer_num+1):
                    lowerdir = lowerdir+":dir"+str(i)
                start_time = time.time()
                subprocess.call(command.format(lowerdir), shell=True)
                stop_time = time.time()
                internal = stop_time-start_time
                recorder.set(layer_num, step_num, file_split_num, internal)
                print("层数:{0},文件大小:{1},文件拆分:{2},耗时:{3}".format(
                    layer_num, file_size, file_split_num, internal), flush=True)


sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')
lower_layer_range = [498, 500]
file_split_range = [0, 3]
start_file_size = 1
step_size = 1
total_step = 0
is_random = False
print("层数:{0},文件拆分:{1},起始文件大小:{2},间隔大小:{3},总间隔:{4},随机:{5}".format(
    lower_layer_range, file_split_range, start_file_size, step_size, total_step, is_random), flush=True)
evaluate_overlay(lower_layer_range, file_split_range,
                 start_file_size, step_size, total_step, is_random)
