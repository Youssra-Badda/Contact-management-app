package com.ensah.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ensah.bo.Contact;


public interface IContactDao extends JpaRepository<Contact, Long> {
	public Contact findBynom(String nom);
	public List<Contact> findAllByOrderByNomAsc();
	public Contact findByteleper(String num);
	public Contact findByteleprof(String num);
}
