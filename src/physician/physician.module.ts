import { Module } from '@nestjs/common';
import { PhysicianService } from './physician.service';
import { PhysicianController } from './physician.controller';
import { DatabaseModule } from 'src/database/database.module';

@Module({
  controllers: [PhysicianController],
  providers: [PhysicianService],
  imports: [DatabaseModule],
})
export class PhysicianModule {}
