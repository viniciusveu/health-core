import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { PhysicianService } from './physician.service';
import { CreatePhysicianDto } from './dto/create-physician.dto';
import { UpdatePhysicianDto } from './dto/update-physician.dto';

@Controller('physicians')
export class PhysicianController {
  constructor(private readonly physicianService: PhysicianService) {}

  @Post()
  create(@Body() createPhysicianDto: CreatePhysicianDto) {
    return this.physicianService.create(createPhysicianDto);
  }

  @Get()
  findAll() {
    return this.physicianService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: number) {
    return this.physicianService.findOne(id);
  }

  @Patch(':id')
  update(
    @Param('id') id: number,
    @Body() updatePhysicianDto: UpdatePhysicianDto,
  ) {
    return this.physicianService.update(id, updatePhysicianDto);
  }

  @Delete(':id')
  remove(@Param('id') id: number) {
    return this.physicianService.remove(id);
  }

  @Get(':id/specialties')
  getSpecialties(@Param('id') id: number) {
    return this.physicianService.getSpecialties(id);
  }

  @Post(':id/specialties')
  addSpecialty(
    @Param('id') id: number,
    @Body('specialty_id') specialtyId: number,
  ) {
    return this.physicianService.addSpecialty(id, specialtyId);
  }
}
