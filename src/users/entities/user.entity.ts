import { Exclude } from 'class-transformer';
import { Min } from 'class-validator';
import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  pseudo: string;

  @Column({ unique: true })
  email: string;

  @Exclude()
  @Column()
  password: string;

  @Column({ default: 1000 })
  @Min(0)
  bank: number;

  @Column({ default: 0 })
  @Min(0)
  victoryStats: number;
}
