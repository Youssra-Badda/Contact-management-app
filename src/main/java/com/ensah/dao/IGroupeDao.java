package com.ensah.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ensah.bo.Groupe;


public interface IGroupeDao extends JpaRepository<Groupe, Long>{
      public Groupe findBynom(String nom);
}
