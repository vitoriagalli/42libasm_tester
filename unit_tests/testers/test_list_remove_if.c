/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_list_remove_if.c                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vscabell <vscabell@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/09/23 17:19:56 by vscabell          #+#    #+#             */
/*   Updated: 2020/09/23 20:26:32 by vscabell         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "header_test.h"

int	main(int argc, char **argv)
{
	int		index;
	t_list	*list;

	index = atoi(argv[1]);
	initialize_list(&list, index, &list_push_front);
	ft_list_remove_if(&list, "milk", &funct_strcmp, &ft_free);
	ft_print_list(list);
	ft_list_clear(list, &ft_free);
	return (0);
}
