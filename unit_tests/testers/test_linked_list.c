/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_linked_list.c                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vscabell <vscabell@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/09/20 02:48:54 by vscabell          #+#    #+#             */
/*   Updated: 2020/09/21 22:06:36 by vscabell         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "header_test.h"

void	initialize_lists(t_list **list0, t_list **list1, t_list **list2,
	t_list **list3)
{
	*list0 = NULL;
	*list1 = NULL;
	ft_list_push_front(list1, "milk");
	*list2 = NULL;
	ft_list_push_front(list2, "milk");
	ft_list_push_front(list2, "milk");
	ft_list_push_front(list2, "milk");
	*list3 = NULL;
	ft_list_push_front(list3, "apple");
	ft_list_push_front(list3, "milk");
	ft_list_push_front(list3, "bread");
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

int	main(int argc, char **argv)
{
	int		funct;
	int		index;
	t_list	**list;

	funct = atoi(argv[1]);
	index = atoi(argv[2]);
	list = (t_list **)malloc(sizeof(t_list *) * 4);
	initialize_lists(&list[0], &list[1], &list[2], &list[3]);
	if (funct == PUSH_FRONT)
		ft_print_list(list[index]);
	else if (funct == SIZE)
		printf("%i\n", ft_list_size(list[index]));
	else if (funct == SORT)
	{
		ft_list_sort(&list[index], ft_strcmp);
		ft_print_list(list[index]);
	}
	else if (funct == REMOVE_IF)
	{
		ft_list_remove_if(&list[index], "milk", ft_strcmp, ft_free);
		ft_print_list(list[index]);
	}

	return (0);
}
