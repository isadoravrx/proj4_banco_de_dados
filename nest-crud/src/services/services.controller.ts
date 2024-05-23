import { Controller, Get, Post, Body, Put, Param, Delete, NotFoundException } from '@nestjs/common';
import { ServicesService } from './services.service';
import { Service } from './service.entity';

@Controller('services')
export class ServicesController {
    constructor(private readonly service: ServicesService) {}

    @Get()
    async findAll(): Promise<Service[]> {
        return this.service.findAll();
    }

    @Get(':id')
    async findOne(@Param('id') id: number): Promise<Service> {
        const Service = await this.service.findOne(id)
        if(!Service) {
            throw new NotFoundException("Service does not exist");
        } else {
            return Service;
        }
        
    }

    @Post()
    async create(@Body() service: Service): Promise<Service> {
        return this.service.create(service);
    }

    @Put(':id')
    async update(@Param('id') id: number, @Body() service: Service): Promise<any> {
        return this.service.update(id, service);
    }

    @Delete(':id')
    async delete(@Param('id') id: number): Promise<any> {
        const service = await this.service.findOne(id);
        if(!service) {
            throw new NotFoundException("service does not exist");
        } 
        
        return this.service.delete(id);
        
    }
}
