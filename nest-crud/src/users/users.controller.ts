import { Controller, Get, Post, Body, Put, Param, Delete, NotFoundException } from '@nestjs/common';
import { UsersService } from './users.service';
import { User } from './user.entity';

@Controller('users')
export class UsersController {
    constructor(private readonly usersService: UsersService) {}

    @Get()
    async findAll(): Promise<User[]> {
        return this.usersService.findAll();
    }

    @Get(':id')
    async findOne(@Param('id') id: number): Promise<User> {
        const user = await this.usersService.findOne(id)
        if(!user) {
            throw new NotFoundException("User does not exist");
        } else {
            return user;
        }
        
    }

    @Post()
    async create(@Body() user: User): Promise<User> {
        return this.usersService.create(user);
    }

    @Put(':id')
    async update(@Param('id') id: number, @Body() user: User): Promise<any> {
        return this.usersService.update(id, user);
    }

    @Delete(':id')
    async delete(@Param('id') id: number): Promise<any> {
        const user = await this.usersService.findOne(id);
        if(!user) {
            throw new NotFoundException("User does not exist");
        } 
        
        return this.usersService.delete(id);
        
    }
}
