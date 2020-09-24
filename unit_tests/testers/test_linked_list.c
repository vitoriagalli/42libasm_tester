/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_linked_list.c                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vscabell <vscabell@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/09/20 02:48:54 by vscabell          #+#    #+#             */
/*   Updated: 2020/09/23 20:31:19 by vscabell         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "header_test.h"

static t_list	*ft_create_elem(void *data)
{
	t_list	*node;

	if (!(node = malloc(sizeof(t_list))))
		return (NULL);
	node->data = data;
	node->next = NULL;
	return (node);
}

void	list_push_front(t_list **begin_list, void *data)
{
	t_list	*node;

	if (!begin_list)
		return ;
	if (!(*begin_list))
		*begin_list = ft_create_elem(data);
	else
	{
		node = ft_create_elem(data);
		node->next = *begin_list;
		*begin_list = node;
	}
}

void	initialize_list(t_list **list, int index, void (*ft)())
{
	if (index == 0)
		*list = NULL;
	else if (index == 1)
	{
		*list = NULL;
		ft(list, strdup("milk"));
	}
	else if (index == 2)
	{
		*list = NULL;
		ft(list, strdup("milk"));
		ft(list, strdup("milk"));
		ft(list, strdup("milk"));
	}
	else if (index == 3)
	{
		*list = NULL;
		ft(list, strdup("apple"));
		ft(list, strdup("milk"));
		ft(list, strdup("bread"));
	}
	else if (index == 4)
	{
		*list = NULL;
		ft(list, strdup("milk"));
		ft(list, strdup("bread"));
		ft(list, strdup("milk"));
		ft(list, strdup("apple"));
		ft(list, strdup("ZEBRA"));
		ft(list, strdup("tomato"));
		ft(list, strdup("milk"));
	}
}

void	ft_print_list(t_list *list)
{
	while (list)
	{
		printf("%s\n", (char*)(list->data));
		list = list->next;
	}
}

void	ft_free(void *ptr)
{
	if (ptr)
		free(ptr);
}

void	ft_list_clear(t_list *begin_list, void (*free_fct)(void *))
{
	t_list	*aux;

	if (!begin_list || !free_fct)
		return ;
	while (begin_list)
	{
		aux = begin_list;
		begin_list = begin_list->next;
		(free_fct)(aux->data);
		free(aux);
	}
	begin_list = NULL;
}

int		funct_strcmp(const char *s1, const char *s2)
{
	while (*s1 && (*s1 == *s2))
	{
		s1++;
		s2++;
	}
	return *(const unsigned char*)s1 - *(const unsigned char*)s2;
}
