%% ===========================================================================
%% @doc        Base module for twerl services declaring all required
%%             callbacks and implementing some when meaningful.
%% @since      Apr 10, 2010
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

-module(base_service).

-author('Sebastien Merle <s.merle@gmail.com>').

-behaviour(gen_service).

-erlog_category(service).


%% --------------------------------------------------------------------
%% Includes
%% --------------------------------------------------------------------

-include("twerl.hrl").

-include("base_service.specs.hrl").


%% --------------------------------------------------------------------
%% Exports
%% --------------------------------------------------------------------

%% API exports
-export([]).

%% Behaviour gen_service callbacks
-export([init/1,
         setup/2,
         terminate/3,
         code_change/3]).


%% ====================================================================
%% Behaviour gen_service Callbacks
%% ====================================================================

%% --------------------------------------------------------------------
%% @doc Called to initialise service's process state.

init(_Args) ->
    erlang:error(not_implemented).


%% --------------------------------------------------------------------
%% @doc Called to setup service process.

setup(State, _Service) ->
    {ok, State}.


%% --------------------------------------------------------------------
%% @doc Called when service process is terminating.

terminate(shutdown, _State, _Service) ->
    erlog:info("Service shutdown."),
    ok;
terminate(normal, _State, _Service) ->
    erlog:info("Service terminated normaly."),
    ok;
terminate(Reason, _State, _Service) ->
    erlog:warn("Service terminated: ~p.", [Reason]),
    ok.


%% --------------------------------------------------------------------
%% @doc Called to upgrade service's process state.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.
