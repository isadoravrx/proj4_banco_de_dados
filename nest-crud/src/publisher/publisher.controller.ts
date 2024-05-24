import { Controller, Get, Post, Body, Put, Param, Delete, NotFoundException } from '@nestjs/common';
import { PublisherService } from './publisher.service';
import { Publisher } from './entities/publisher.entity';

@Controller('publisher')
export class PublisherController {
    constructor(private readonly publisherService: PublisherService) {}

    @Get()
    async findAll(): Promise<Publisher[]> {
        return this.publisherService.findAll();
    }

    @Get(':name')
    async findOne(@Param('name') name: string): Promise<Publisher> {
        const publisher = await this.publisherService.findOne(name);
        if (!publisher) {
            throw new NotFoundException("Publisher does not exist");
        } else {
            return publisher;
        }
    }

    @Post()
    async create(@Body() publisher: Partial<Publisher>): Promise<Publisher> {
        return this.publisherService.create(publisher);
    }

    @Put(':name')
    async update(@Param('name') name: string, @Body() publisher: Partial<Publisher>): Promise<any> {
        return this.publisherService.update(name, publisher);
    }

    @Delete(':name')
    async remove(@Param('name') name: string): Promise<any> {
        const publisher = await this.publisherService.findOne(name);
        if (!publisher) {
            throw new NotFoundException("Publisher does not exist");
        } else {
            return this.publisherService.delete(name);
        }
    }
}
