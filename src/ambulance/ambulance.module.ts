import { Module } from '@nestjs/common';
import { AmbulanceService } from './ambulance.service';
import { AmbulanceController } from './ambulance.controller';
import { DatabaseModule } from 'src/database/database.module';

@Module({
  imports: [DatabaseModule],
  controllers: [AmbulanceController],
  providers: [AmbulanceService],
})
export class AmbulanceModule {}
