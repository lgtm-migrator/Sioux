// Copyright (c) Torrox GmbH & Co KG. All rights reserved.
// Please note that the content of this file is confidential or protected by law.
// Any unauthorised copying or unauthorised distribution of the information contained herein is prohibited.

#include <cassert>
#include <algorithm>
#include "server/body_decoder.h"

namespace server
{
	std::size_t body_decoder::feed_buffer( const char* buffer, std::size_t size )
	{
		assert( buffer );
		assert( size );
		assert( current_size_ == 0 ); // undecoded bytes

		current_size_ = std::min( size, total_size_ );
		current_      = buffer;
		total_size_  -= current_size_;

		return current_size_;
	}

	std::pair< std::size_t, const char* > body_decoder::decode()
	{
		const std::pair< std::size_t, const char* > result( current_size_, current_ );
		current_size_ = 0;

		return result;
	}

    void body_decoder::start_content_length_encoded( std::size_t size )
    {
        total_size_   = size;
        current_size_ = 0;
        current_      = 0;
    }

}