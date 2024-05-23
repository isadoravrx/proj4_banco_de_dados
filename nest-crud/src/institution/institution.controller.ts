import { Controller, Get, Post, Body, Put, Param, Delete, NotFoundException } from '@nestjs/common';
import { InstitutionService } from './institution.service';
import { Institution } from './entities/institution.entity';

@Controller('institution')
export class InstitutionController {
    constructor(private readonly Institution: InstitutionService) {}

    @Get()
    async findAll(): Promise<Institution[]> {
        return this.Institution.findAll();
    }

    @Get(':id')
    async findOne(@Param('id') id: number): Promise<Institution> {
        const Institution = await this.Institution.findOne(id)
        if(!Institution) {
            throw new NotFoundException("Institution does not exist");
        } else {
            return Institution;
        }
        
    }

    @Post()
    async create(@Body() Institution: Institution): Promise<Institution> {
        return this.Institution.create(Institution);
    }

    @Put(':id')
    async update(@Param('id') id: number, @Body() Institution: Institution): Promise<any> {
        return this.Institution.update(id, Institution);
    }

    @Delete(':id')
    async delete(@Param('id') id: number): Promise<any> {
        const Institution = await this.Institution.findOne(id);
        if(!Institution) {
            throw new NotFoundException("Institution does not exist");
        } 
        
        return this.Institution.delete(id);
        
    }
}
