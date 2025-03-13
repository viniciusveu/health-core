import { Injectable } from '@nestjs/common';
import { CreateAmbulanceDto } from './dto/create-ambulance.dto';
import { UpdateAmbulanceDto } from './dto/update-ambulance.dto';
import { DatabaseService } from 'src/database/database.service';

@Injectable()
export class AmbulanceService {
  constructor(private readonly databaseService: DatabaseService) { }

  create(createAmbulanceDto: CreateAmbulanceDto) {
    return this.databaseService.ambulance.create({ data: createAmbulanceDto });
  }

  findAll() {
    return this.databaseService.ambulance.findMany();
  }

  findOne(id: number) {
    return this.databaseService.ambulance.findUnique({ where: { id } });
  }

  update(id: number, updateAmbulanceDto: UpdateAmbulanceDto) {
    return this.databaseService.ambulance.update({
      where: { id },
      data: updateAmbulanceDto
    });
  }

  remove(id: number) {
    return this.databaseService.ambulance.delete({ where: { id } });
  }
}
