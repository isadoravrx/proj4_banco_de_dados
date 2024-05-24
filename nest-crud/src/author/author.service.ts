import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Author } from './entities/author.entity';

@Injectable()
export class AuthorService {
    constructor(
        @InjectRepository(Author)
        private authorRepository: Repository<Author>,
    ) {}

    async findAll(): Promise<Author[]> {
        return this.authorRepository.find();
    }

    async findOne(id: number): Promise<Author> {
        return this.authorRepository.findOne({ where: { authorId: id } });
    }

    async create(author: Partial<Author>): Promise<Author> {
        const newAuthor = this.authorRepository.create(author);
        return this.authorRepository.save(newAuthor);
    }

    async update(id: number, author: Partial<Author>): Promise<Author> {
        await this.authorRepository.update(id, author);
        return this.authorRepository.findOne({ where: { authorId: id } });
    }

    async delete(id: number): Promise<void> {
        await this.authorRepository.delete(id);
    }
}
