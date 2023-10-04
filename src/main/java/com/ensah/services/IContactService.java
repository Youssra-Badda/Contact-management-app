package com.ensah.services;

import java.util.List;

import com.ensah.bo.Contact;
import com.ensah.bo.Groupe;

public interface IContactService {
	public void addContact(Contact contact);

	public void updateContact(Contact contact);

	public List<Contact> getAllContact(); //par ordre alphabetique

	public void deleteContact(Long id);

	public Contact getContactByName(String nom);
	public Contact getContactById(Long id);
	public List<Contact> getAllContactsOrderedByName();
	public Contact getByNumPersonelOrProfesionel(String tele);
	
	
	//************Groupe***************
	public List<Groupe> getAllGroup();
	public Groupe getGroupById(Long id);
	public Groupe getGroupByName(String nom);
	public void addGroup(Groupe group);
	public void deleteGroup(Long id);
	
}
