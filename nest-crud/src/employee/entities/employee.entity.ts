import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  OneToOne,
  JoinColumn,
} from 'typeorm';
import { User } from '../../users/user.entity';

@Entity()
export class Employee {
  @PrimaryGeneratedColumn() // Primary Key
  id: number;

  @Column()
  pis_number: number;

  @Column()
  bank_account: number;

  @Column()
  salary: number;

  @Column()
  user_id: number;

  @OneToOne(() => User, (user) => user.employee, { onDelete: 'CASCADE' })
  @JoinColumn({ name: 'user_id' })
  user: User;
}
