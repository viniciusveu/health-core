import { Module } from '@nestjs/common';
import { ScheduleService } from './schedule.service';
import { ScheduleController } from './schedule.controller';
import { DatabaseModule } from 'src/database/database.module';

@Module({
  controllers: [ScheduleController],
  providers: [ScheduleService],
  imports: [DatabaseModule], 
})
export class ScheduleModule {}
