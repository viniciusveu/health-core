import { Test, TestingModule } from '@nestjs/testing';
import { PatientService } from './patient.service';
import { DatabaseService } from '../database/database.service';
import { CreatePatientDto } from './dto/create-patient.dto';

describe('PatientService', () => {
  let service: PatientService;
  let databaseService: DatabaseService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        PatientService,
        {
          provide: DatabaseService,
          useValue: { patient: { create: jest.fn() } },
        },
      ],
    }).compile();

    service = module.get<PatientService>(PatientService);
    databaseService = module.get<DatabaseService>(DatabaseService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
    expect(databaseService).toBeDefined();
  });

  it('should create a patient', () => {
    const createPatientDto = new CreatePatientDto();
    const patient = service.create(createPatientDto);
    expect(patient).toEqual(undefined);
  });
});
