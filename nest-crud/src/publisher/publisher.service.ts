import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Publisher } from './entities/publisher.entity';

@Injectable()
export class PublisherService {
    constructor(
        @InjectRepository(Publisher)
        private publisherRepository: Repository<Publisher>,
    ) {}

    async findAll(): Promise<Publisher[]> {
        return this.publisherRepository.find();
    }

    async findOne(name: string): Promise<Publisher> {
        return this.publisherRepository.findOne({ where: { name } });
    }

    async create(publisher: Partial<Publisher>): Promise<Publisher> {
        const newPublisher = this.publisherRepository.create(publisher);
        return this.publisherRepository.save(newPublisher);
    }

    async update(name: string, publisher: Partial<Publisher>): Promise<Publisher> {
        await this.publisherRepository.update({ name }, publisher);
        return this.publisherRepository.findOne({ where: { name } });
    }

    async delete(name: string): Promise<void> {
        await this.publisherRepository.delete({ name });
    }
}
