import { Injectable } from '@nestjs/common';
import { CreateSpecialtyDto } from './dto/create-specialty.dto';
import { UpdateSpecialtyDto } from './dto/update-specialty.dto';
import { DatabaseService } from 'src/database/database.service';

@Injectable()
export class SpecialtyService {
  constructor(private readonly prisma: DatabaseService) {}

  create(createSpecialtyDto: CreateSpecialtyDto) {
    return this.prisma.specialty.create({ data: createSpecialtyDto });
  }

  findAll() {
    return this.prisma.specialty.findMany();
  }

  findOne(id: number) {
    return this.prisma.specialty.findUnique({ where: { id } });
  }

  update(id: number, updateSpecialtyDto: UpdateSpecialtyDto) {
    return this.prisma.specialty.update({
      where: { id },
      data: updateSpecialtyDto,
    });
  }

  remove(id: number) {
    return this.prisma.specialty.delete({ where: { id } });
  }
}
