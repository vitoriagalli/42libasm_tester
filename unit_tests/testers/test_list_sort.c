/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_list_sort.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vscabell <vscabell@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/09/23 17:19:52 by vscabell          #+#    #+#             */
/*   Updated: 2020/09/24 18:48:50 by vscabell         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "header_test.h"

int	main(int argc, char **argv)
{
	int		index;
	t_list	*list;

	(void)argc;
	list = NULL;
	index = atoi(argv[1]);
	initialize_list(&list, index, list_push_front);
	ft_list_sort(&list, strcmp);
	ft_print_list(list);
	ft_list_clear(list, ft_free);
	return (0);
}
