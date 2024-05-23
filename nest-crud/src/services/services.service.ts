import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import {Service} from './service.entity';

@Injectable()
export class ServicesService {
    constructor(
        @InjectRepository(Service)
        private serviceRepository: Repository<Service>,
    ) {}

    async findAll(): Promise<Service[]> {
        return this.serviceRepository.find();
    }

    async findOne(id: number): Promise<Service> {
        return this.serviceRepository.findOne({where: {id}})
    }

    async create(user: Partial<Service>): Promise<Service> {
        const newUser = this.serviceRepository.create(user);
        return this.serviceRepository.save(newUser);
    }

    async update(id: number, user: Partial<Service>): Promise<Service> {
        await this.serviceRepository.update(id, user);
        return this.serviceRepository.findOne({where: {id}});
    }

    async delete(id: number): Promise<void> {
        await this.serviceRepository.delete(id);
    }
}
