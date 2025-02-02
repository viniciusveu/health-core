import { Test, TestingModule } from '@nestjs/testing';
import { PhysicianService } from './physician.service';
import { DatabaseService } from '../database/database.service';

describe('PhysicianService', () => {
  let service: PhysicianService;
  let databaseService: DatabaseService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        PhysicianService,
        {
          provide: DatabaseService,
          useValue: { patient: { create: jest.fn() } },
        }
      ],
    }).compile();

    service = module.get<PhysicianService>(PhysicianService);
    databaseService = module.get<DatabaseService>(DatabaseService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
    expect(databaseService).toBeDefined();
  });
});
