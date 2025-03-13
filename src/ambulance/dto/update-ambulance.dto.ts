import { PartialType } from '@nestjs/mapped-types';
import { CreateAmbulanceDto } from './create-ambulance.dto';

export class UpdateAmbulanceDto extends PartialType(CreateAmbulanceDto) {}
