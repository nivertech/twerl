%% ===========================================================================
%% @doc        Twerl interface.
%% @since      Mar 23, 2010
%% @version    1.0
%% @copyright  2009, Sebastien Merle <s.merle@gmail.com>
%% @author     Sebastien Merle <s.merle@gmail.com>
%% @end
%%
%% Copyright (c) 2009, Sebastien Merle <s.merle@gmail.com>
%% All rights reserved.
%%
%% Redistribution and use in source and binary forms, with or without
%% modification, are permitted provided that the following conditions are met:
%%
%%   * Redistributions of source code must retain the above copyright
%%     notice, this list of conditions and the following disclaimer.
%%   * Redistributions in binary form must reproduce the above copyright
%%     notice, this list of conditions and the following disclaimer in the
%%     documentation and/or other materials provided with the distribution.
%%   * Neither the name of "twerl" nor the names of its contributors
%%     may be used to endorse or promote products derived from this software
%%     without specific prior written permission.
%%
%% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
%% AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
%% IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
%% ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
%% LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
%% CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
%% SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
%% INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
%% CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
%% ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
%% POSSIBILITY OF SUCH DAMAGE.
%% ===========================================================================

-module(twerl).

-author('Sebastien Merle <s.merle@gmail.com>').

-erlog_category(twerl).


%% --------------------------------------------------------------------
%% Includes
%% --------------------------------------------------------------------

-include("twerl.hrl").


%% --------------------------------------------------------------------
%% Exports
%% --------------------------------------------------------------------

%% API exports
-export([start/0,
         stop/0,
         restart/0,
         create_service/2,
         stop_service/1]).


%% ====================================================================
%% API Functions
%% ====================================================================

%% --------------------------------------------------------------------
%% @doc Starts twerl framework.

-spec start() -> ok | {error, term()}.

start() -> application:start(twerl).


%% --------------------------------------------------------------------
%% @doc Stops twerl framework.

-spec stop() -> ok | {error, term()}.

stop() -> application:stop(twerl).


%% --------------------------------------------------------------------
%% @doc Restart twerl framework.

-spec restart() -> ok | {error, term()}.

restart() ->
    application:stop(twerl),
    application:start(twerl).


%% --------------------------------------------------------------------
%% @doc Creates and starts a service with specified name and definition. 

create_service(Name, ServiceDef) ->
    twerl_controller:create_service(Name, ServiceDef).


%% --------------------------------------------------------------------
%% @doc Stops the service with specified name.

stop_service(Name) ->
    twerl_controller:stop_service(Name).
