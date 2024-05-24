import { Controller, Get, Post, Body, Put, Param, Delete, NotFoundException } from '@nestjs/common';
import { AuthorService } from './author.service';
import { Author } from './entities/author.entity';

@Controller('author')
export class AuthorController {
    constructor(private readonly authorService: AuthorService) {}

    @Get()
    async findAll(): Promise<Author[]> {
        return this.authorService.findAll();
    }

    @Get(':id')
    async findOne(@Param('id') id: number): Promise<Author> {
        const author = await this.authorService.findOne(id);
        if (!author) {
            throw new NotFoundException("Author does not exist");
        } else {
            return author;
        }
    }

    @Post()
    async create(@Body() author: Partial<Author>): Promise<Author> {
        return this.authorService.create(author);
    }

    @Put(':id')
    async update(@Param('id') id: number, @Body() author: Partial<Author>): Promise<any> {
        return this.authorService.update(id, author);
    }

    @Delete(':id')
    async remove(@Param('id') id: number): Promise<any> {
        const author = await this.authorService.findOne(id);
        if (!author) {
            throw new NotFoundException("Author does not exist");
        } else {
            return this.authorService.delete(id);
        }
    }
}
