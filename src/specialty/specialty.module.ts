import { Module } from '@nestjs/common';
import { SpecialtyService } from './specialty.service';
import { SpecialtyController } from './specialty.controller';
import { DatabaseModule } from 'src/database/database.module';

@Module({
  controllers: [SpecialtyController],
  providers: [SpecialtyService],
  imports: [DatabaseModule],
})
export class SpecialtyModule {}
