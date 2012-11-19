//  Created by Alejandro Isaza on 2012-11-17.
//  Copyright (c) 2012 Synergy Media. All rights reserved.

#ifndef __poly__polygon__
#define __poly__polygon__

#include "point.h"
#include <list>

namespace mb {
	class polygon {
	public:
		typedef std::size_t size_t;
		typedef std::list<point> list_t;
		typedef list_t::iterator iterator;
		typedef list_t::const_iterator const_iterator;
		typedef list_t::reverse_iterator reverse_iterator;
		typedef list_t::const_reverse_iterator const_reverse_iterator;
		
	public:
		polygon() {}
		
		size_t vetex_count() const {
			return _vertices.size();
		}
		bool empty() const {
			return _vertices.empty();
		}
		
		iterator vertices_begin() {
			return _vertices.begin();
		}
		const_iterator vertices_begin() const {
			return _vertices.begin();
		}
		iterator vertices_end() {
			return _vertices.end();
		}
		const const_iterator vertices_end() const {
			return _vertices.end();
		}
		
		reverse_iterator vertices_rbegin() {
			return _vertices.rbegin();
		}
		const_reverse_iterator vertices_rbegin() const {
			return _vertices.rbegin();
		}
		reverse_iterator vertices_rend() {
			return _vertices.rend();
		}
		const const_reverse_iterator vertices_rend() const {
			return _vertices.rend();
		}
		
		void add_vertex(const point& p) {
			_vertices.push_back(p);
		}
		template <typename iterator>
		void add_vertices(iterator begin, iterator end) {
			_vertices.insert(_vertices.end(), begin, end);
		}
		void remove_vertex(iterator it) {
			_vertices.erase(it);
		}
		void clear() {
			_vertices.clear();
		}
		void swap(polygon& p) {
			_vertices.swap(p._vertices);
		}
		
	private:
		list_t _vertices;
	};
}

#endif
