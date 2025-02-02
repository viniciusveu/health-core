import { Injectable } from '@nestjs/common';
import { CreatePhysicianDto } from './dto/create-physician.dto';
import { UpdatePhysicianDto } from './dto/update-physician.dto';
import { DatabaseService } from '../database/database.service';

@Injectable()
export class PhysicianService {

  constructor(private readonly prisma: DatabaseService) { }

  create(createPhysicianDto: CreatePhysicianDto) {
    return this.prisma.physician.create({ data: createPhysicianDto });
  }

  findAll() {
    return this.prisma.physician.findMany();
  }

  findOne(id: number) {
    return this.prisma.physician.findUnique({ where: { id } });
  }

  update(id: number, updatePhysicianDto: UpdatePhysicianDto) {
    return this.prisma.physician.update({ where: { id }, data: updatePhysicianDto });
  }

  remove(id: number) {
    return this.prisma.physician.delete({ where: { id } });
  }

  getSpecialties(id: number) {
    return this.prisma.physician_Specialty.findMany({ where: { physician_id: id }, include: { Physician: true, Specialty: true } });
  }

  addSpecialty(id: number, specialtyId: number) {
    return this.prisma.physician_Specialty.create({
      data:
      {
        physician_id: id,
        specialty_id: specialtyId
      }
    });
  }
}
