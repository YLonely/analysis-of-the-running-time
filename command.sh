#!/bin/bash
for i in 1 2 3 4 5 6
do
    time mount -t overlay overlay -o lowerdir=dir1:dir2:dir3:dir4:dir5:dir6:dir7:dir8:dir9:dir10:dir11:dir12:dir13:dir14:dir15:dir16:dir17:dir18:dir19:dir20:dir21:dir22:dir23:dir24:dir25:dir26:dir27:dir28:dir29:dir30:dir31:dir32:dir33:dir34:dir35:dir36:dir37:dir38:dir39:dir40:dir41:dir42:dir43:dir44:dir45:dir46:dir47:dir48:dir49:dir50:dir51:dir52:dir53:dir54:dir55:dir56:dir57:dir58:dir59:dir60:dir61:dir62:dir63:dir64:dir65:dir66:dir67:dir68:dir69:dir70:dir71:dir72:dir73:dir74:dir75:dir76:dir77:dir78:dir79:dir80:dir81:dir82:dir83:dir84:dir85:dir86:dir87:dir88:dir89:dir90:dir91:dir92:dir93:dir94:dir95:dir96:dir97:dir98:dir99:dir100:dir101:dir102:dir103:dir104:dir105:dir106:dir107:dir108:dir109:dir110:dir111:dir112:dir113:dir114:dir115:dir116:dir117:dir118:dir119:dir120:dir121:dir122:dir123:dir124:dir125:dir126:dir127:dir128:dir129:dir130:dir131:dir132:dir133:dir134:dir135:dir136:dir137:dir138:dir139:dir140:dir141:dir142:dir143:dir144:dir145:dir146:dir147:dir148:dir149:dir150:dir151:dir152:dir153:dir154:dir155:dir156:dir157:dir158:dir159:dir160:dir161:dir162:dir163:dir164:dir165:dir166:dir167:dir168:dir169:dir170:dir171:dir172:dir173:dir174:dir175:dir176:dir177:dir178:dir179:dir180:dir181:dir182:dir183:dir184:dir185:dir186:dir187:dir188:dir189:dir190:dir191:dir192:dir193:dir194:dir195:dir196:dir197:dir198:dir199:dir200:dir201:dir202:dir203:dir204:dir205:dir206:dir207:dir208:dir209:dir210:dir211:dir212:dir213:dir214:dir215:dir216:dir217:dir218:dir219:dir220:dir221:dir222:dir223:dir224:dir225:dir226:dir227:dir228:dir229:dir230:dir231:dir232:dir233:dir234:dir235:dir236:dir237:dir238:dir239:dir240:dir241:dir242:dir243:dir244:dir245:dir246:dir247:dir248:dir249:dir250:dir251:dir252:dir253:dir254:dir255:dir256:dir257:dir258:dir259:dir260:dir261:dir262:dir263:dir264:dir265:dir266:dir267:dir268:dir269:dir270:dir271:dir272:dir273:dir274:dir275:dir276:dir277:dir278:dir279:dir280:dir281:dir282:dir283:dir284:dir285:dir286:dir287:dir288:dir289:dir290:dir291:dir292:dir293:dir294:dir295:dir296:dir297:dir298:dir299:dir300:dir301:dir302:dir303:dir304:dir305:dir306:dir307:dir308:dir309:dir310:dir311:dir312:dir313:dir314:dir315:dir316:dir317:dir318:dir319:dir320:dir321:dir322:dir323:dir324:dir325:dir326:dir327:dir328:dir329:dir330:dir331:dir332:dir333:dir334:dir335:dir336:dir337:dir338:dir339:dir340:dir341:dir342:dir343:dir344:dir345:dir346:dir347:dir348:dir349:dir350:dir351:dir352:dir353:dir354:dir355:dir356:dir357:dir358:dir359:dir360:dir361:dir362:dir363:dir364:dir365:dir366:dir367:dir368:dir369:dir370:dir371:dir372:dir373:dir374:dir375:dir376:dir377:dir378:dir379:dir380:dir381:dir382:dir383:dir384:dir385:dir386:dir387:dir388:dir389:dir390:dir391:dir392:dir393:dir394:dir395:dir396:dir397:dir398:dir399:dir400:dir401:dir402:dir403:dir404:dir405:dir406:dir407:dir408:dir409:dir410:dir411:dir412:dir413:dir414:dir415:dir416:dir417:dir418:dir419:dir420:dir421:dir422:dir423:dir424:dir425:dir426:dir427:dir428:dir429:dir430:dir431:dir432:dir433:dir434:dir435:dir436:dir437:dir438:dir439:dir440:dir441:dir442:dir443:dir444:dir445:dir446:dir447:dir448:dir449:dir450:dir451:dir452:dir453:dir454:dir455:dir456:dir457:dir458:dir459:dir460:dir461:dir462:dir463:dir464:dir465:dir466:dir467:dir468:dir469:dir470:dir471:dir472:dir473:dir474:dir475:dir476:dir477:dir478:dir479:dir480:dir481:dir482:dir483:dir484:dir485:dir486:dir487:dir488:dir489:dir490:dir491:dir492:dir493:dir494:dir495:dir496:dir497:dir498:dir499,upperdir=upper,workdir=work merge
    umount -l merge
done