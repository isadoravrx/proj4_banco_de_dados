import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import {Institution} from './entities/institution.entity';

@Injectable()
export class InstitutionService {
    constructor(
        @InjectRepository(Institution)
        private institutionRepository: Repository<Institution>,
    ) {}

    async findAll(): Promise<Institution[]> {
        return this.institutionRepository.find();
    }

    async findOne(id: number): Promise<Institution> {
        return this.institutionRepository.findOne({where: {id}})
    }

    async create(user: Partial<Institution>): Promise<Institution> {
        const newUser = this.institutionRepository.create(user);
        return this.institutionRepository.save(newUser);
    }

    async update(id: number, user: Partial<Institution>): Promise<Institution> {
        await this.institutionRepository.update(id, user);
        return this.institutionRepository.findOne({where: {id}});
    }

    async delete(id: number): Promise<void> {
        await this.institutionRepository.delete(id);
    }
}
