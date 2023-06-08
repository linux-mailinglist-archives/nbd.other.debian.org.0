Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B81D6727BA1
	for <lists+nbd@lfdr.de>; Thu,  8 Jun 2023 11:42:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9E554204D8; Thu,  8 Jun 2023 09:42:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun  8 09:42:09 2023
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 928EB204CA
	for <lists-other-nbd@bendel.debian.org>; Thu,  8 Jun 2023 09:41:56 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.091 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id uKPl2Brp0TQ4 for <lists-other-nbd@bendel.debian.org>;
	Thu,  8 Jun 2023 09:41:50 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 9B4E5204C9
	for <nbd@other.debian.org>; Thu,  8 Jun 2023 09:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686217305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qsBCtBvOD9jGcEFO46sb2Q9AanV2LxmQegGhTto4omg=;
	b=EpOa8OndGkhnFy8BHyHsp3UMCe6xwor63+0O26EIaNInQGodBWKIEirdZxBhSMZo2cQsx4
	oGdRt6Dgi9BMz8hfZVZlXdhhonfl8gAF0OaksMTl7IXbTvSLA4RWPk+vicla/UrAd+aDGB
	vB0XDr8wpBL3ESh+yOcofFH6yoRoj44=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-Wt0HHg9KNSKen3JIMN5fmA-1; Thu, 08 Jun 2023 05:41:44 -0400
X-MC-Unique: Wt0HHg9KNSKen3JIMN5fmA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2727B811E78;
	Thu,  8 Jun 2023 09:41:44 +0000 (UTC)
Received: from localhost (unknown [10.39.192.206])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BA880140E955;
	Thu,  8 Jun 2023 09:41:43 +0000 (UTC)
Date: Thu, 8 Jun 2023 10:41:43 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: libguestfs@redhat.com, qemu-block@nongnu.org, nbd@other.debian.org
Subject: Re: [libnbd PATCH v3 18/22] generator: Actually request extended
 headers
Message-ID: <20230608094143.GO7773@redhat.com>
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-19-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230525130108.757242-19-eblake@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ZVwUJncxw-K.A.gGB.xJagkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2537
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230608094143.GO7773@redhat.com
Resent-Date: Thu,  8 Jun 2023 09:42:09 +0000 (UTC)

On Thu, May 25, 2023 at 08:01:04AM -0500, Eric Blake wrote:
> This is the culmination of the previous patches' preparation work for
> using extended headers when possible.  The new states in the state
> machine are copied extensively from our handling of
> OPT_STRUCTURED_REPLY.  The next patch will then expose a new API
> nbd_opt_extended_headers() for manual control.
> 
> At the same time I posted this patch, I had patches for qemu-nbd to
> support extended headers as server (nbdkit is a bit tougher).  The
> next patches will add some interop tests that pass when using a new
> enough qemu-nbd, showing that we have cross-project interoperability
> and therefore an extension worth standardizing.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  generator/API.ml                              | 87 ++++++++---------
>  generator/Makefile.am                         |  1 +
>  generator/state_machine.ml                    | 41 ++++++++
>  .../states-newstyle-opt-extended-headers.c    | 94 +++++++++++++++++++
>  generator/states-newstyle-opt-starttls.c      |  6 +-
>  5 files changed, 184 insertions(+), 45 deletions(-)
>  create mode 100644 generator/states-newstyle-opt-extended-headers.c
> 
> diff --git a/generator/API.ml b/generator/API.ml
> index 7616990a..078f140f 100644
> --- a/generator/API.ml
> +++ b/generator/API.ml
> @@ -953,23 +953,24 @@   "set_request_meta_context", {
>  (all C<nbd_connect_*> calls when L<nbd_set_opt_mode(3)> is false,
>  or L<nbd_opt_go(3)> and L<nbd_opt_info(3)> when option mode is
>  enabled) will also try to issue NBD_OPT_SET_META_CONTEXT when
> -the server supports structured replies and any contexts were
> -registered by L<nbd_add_meta_context(3)>.  The default setting
> -is true; however the extra step of negotiating meta contexts is
> -not always desirable: performing both info and go on the same
> -export works without needing to re-negotiate contexts on the
> -second call; integration testing of other servers may benefit
> -from manual invocation of L<nbd_opt_set_meta_context(3)> at
> -other times in the negotiation sequence; and even when using just
> -L<nbd_opt_info(3)>, it can be faster to collect the server's
> +the server supports structured replies or extended headers and
> +any contexts were registered by L<nbd_add_meta_context(3)>.  The
> +default setting is true; however the extra step of negotiating
> +meta contexts is not always desirable: performing both info and
> +go on the same export works without needing to re-negotiate
> +contexts on the second call; integration testing of other servers
> +may benefit from manual invocation of L<nbd_opt_set_meta_context(3)>
> +at other times in the negotiation sequence; and even when using
> +just L<nbd_opt_info(3)>, it can be faster to collect the server's
>  results by relying on the callback function passed to
>  L<nbd_opt_list_meta_context(3)> than a series of post-process
>  calls to L<nbd_can_meta_context(3)>.
> 
>  Note that this control has no effect if the server does not
> -negotiate structured replies, or if the client did not request
> -any contexts via L<nbd_add_meta_context(3)>.  Setting this
> -control to false may cause L<nbd_block_status(3)> to fail.";
> +negotiate structured replies or extended headers, or if the
> +client did not request any contexts via L<nbd_add_meta_context(3)>.
> +Setting this control to false may cause L<nbd_block_status(3)>
> +to fail.";
>      see_also = [Link "set_opt_mode"; Link "opt_go"; Link "opt_info";
>                  Link "opt_list_meta_context"; Link "opt_set_meta_context";
>                  Link "get_structured_replies_negotiated";
> @@ -1404,11 +1405,11 @@   "opt_info", {
>  If successful, functions like L<nbd_is_read_only(3)> and
>  L<nbd_get_size(3)> will report details about that export.  If
>  L<nbd_set_request_meta_context(3)> is set (the default) and
> -structured replies were negotiated, it is also valid to use
> -L<nbd_can_meta_context(3)> after this call.  However, it may be
> -more efficient to clear that setting and manually utilize
> -L<nbd_opt_list_meta_context(3)> with its callback approach, for
> -learning which contexts an export supports.  In general, if
> +structured replies or extended headers were negotiated, it is also
> +valid to use L<nbd_can_meta_context(3)> after this call.  However,
> +it may be more efficient to clear that setting and manually
> +utilize L<nbd_opt_list_meta_context(3)> with its callback approach,
> +for learning which contexts an export supports.  In general, if
>  L<nbd_opt_go(3)> is called next, that call will likely succeed
>  with the details remaining the same, although this is not
>  guaranteed by all servers.
> @@ -1538,12 +1539,12 @@   "opt_set_meta_context", {
>  recent L<nbd_set_export_name(3)> or L<nbd_connect_uri(3)>.
>  This can only be used if L<nbd_set_opt_mode(3)> enabled option
>  mode.  Normally, this function is redundant, as L<nbd_opt_go(3)>
> -automatically does the same task if structured replies have
> -already been negotiated.  But manual control over meta context
> -requests can be useful for fine-grained testing of how a server
> -handles unusual negotiation sequences.  Often, use of this
> -function is coupled with L<nbd_set_request_meta_context(3)> to
> -bypass the automatic context request normally performed by
> +automatically does the same task if structured replies or extended
> +headers have already been negotiated.  But manual control over
> +meta context requests can be useful for fine-grained testing of
> +how a server handles unusual negotiation sequences.  Often, use
> +of this function is coupled with L<nbd_set_request_meta_context(3)>
> +to bypass the automatic context request normally performed by
>  L<nbd_opt_go(3)>.
> 
>  The NBD protocol allows a client to decide how many queries to ask
> @@ -1597,12 +1598,13 @@   "opt_set_meta_context_queries", {
>  or L<nbd_connect_uri(3)>.  This can only be used if
>  L<nbd_set_opt_mode(3)> enabled option mode.  Normally, this
>  function is redundant, as L<nbd_opt_go(3)> automatically does
> -the same task if structured replies have already been
> -negotiated.  But manual control over meta context requests can
> -be useful for fine-grained testing of how a server handles
> -unusual negotiation sequences.  Often, use of this function is
> -coupled with L<nbd_set_request_meta_context(3)> to bypass the
> -automatic context request normally performed by L<nbd_opt_go(3)>.
> +the same task if structured replies or extended headers have
> +already been negotiated.  But manual control over meta context
> +requests can be useful for fine-grained testing of how a server
> +handles unusual negotiation sequences.  Often, use of this
> +function is coupled with L<nbd_set_request_meta_context(3)> to
> +bypass the automatic context request normally performed by
> +L<nbd_opt_go(3)>.
> 
>  The NBD protocol allows a client to decide how many queries to ask
>  the server.  This function takes an explicit list of queries; to
> @@ -3281,13 +3283,13 @@   "aio_opt_set_meta_context", {
>  recent L<nbd_set_export_name(3)> or L<nbd_connect_uri(3)>.
>  This can only be used if L<nbd_set_opt_mode(3)> enabled option
>  mode.  Normally, this function is redundant, as L<nbd_opt_go(3)>
> -automatically does the same task if structured replies have
> -already been negotiated.  But manual control over meta context
> -requests can be useful for fine-grained testing of how a server
> -handles unusual negotiation sequences.  Often, use of this
> -function is coupled with L<nbd_set_request_meta_context(3)> to
> -bypass the automatic context request normally performed by
> -L<nbd_opt_go(3)>.
> +automatically does the same task if structured replies or
> +extended headers have already been negotiated.  But manual
> +control over meta context requests can be useful for fine-grained
> +testing of how a server handles unusual negotiation sequences.
> +Often, use of this function is coupled with
> +L<nbd_set_request_meta_context(3)> to bypass the automatic
> +context request normally performed by L<nbd_opt_go(3)>.
> 
>  To determine when the request completes, wait for
>  L<nbd_aio_is_connecting(3)> to return false.  Or supply the optional
> @@ -3314,12 +3316,13 @@   "aio_opt_set_meta_context_queries", {
>  or L<nbd_connect_uri(3)>.  This can only be used
>  if L<nbd_set_opt_mode(3)> enabled option mode.  Normally, this
>  function is redundant, as L<nbd_opt_go(3)> automatically does
> -the same task if structured replies have already been
> -negotiated.  But manual control over meta context requests can
> -be useful for fine-grained testing of how a server handles
> -unusual negotiation sequences.  Often, use of this function is
> -coupled with L<nbd_set_request_meta_context(3)> to bypass the
> -automatic context request normally performed by L<nbd_opt_go(3)>.
> +the same task if structured replies or extended headers have
> +already been negotiated.  But manual control over meta context
> +requests can be useful for fine-grained testing of how a server
> +handles unusual negotiation sequences.  Often, use of this
> +function is coupled with L<nbd_set_request_meta_context(3)> to
> +bypass the automatic context request normally performed by
> +L<nbd_opt_go(3)>.
> 
>  To determine when the request completes, wait for
>  L<nbd_aio_is_connecting(3)> to return false.  Or supply the optional
> diff --git a/generator/Makefile.am b/generator/Makefile.am
> index 91dbde5c..fc79b1b9 100644
> --- a/generator/Makefile.am
> +++ b/generator/Makefile.am
> @@ -30,6 +30,7 @@ states_code = \
>  	states-issue-command.c \
>  	states-magic.c \
>  	states-newstyle-opt-export-name.c \
> +	states-newstyle-opt-extended-headers.c \
>  	states-newstyle-opt-list.c \
>  	states-newstyle-opt-go.c \
>  	states-newstyle-opt-meta-context.c \
> diff --git a/generator/state_machine.ml b/generator/state_machine.ml
> index 1f0d00b0..d09ac792 100644
> --- a/generator/state_machine.ml
> +++ b/generator/state_machine.ml
> @@ -297,6 +297,7 @@ and
>     * NEGOTIATING after OPT_STRUCTURED_REPLY or any failed OPT_GO.
>     *)
>    Group ("OPT_STARTTLS", newstyle_opt_starttls_state_machine);
> +  Group ("OPT_EXTENDED_HEADERS", newstyle_opt_extended_headers_state_machine);
>    Group ("OPT_STRUCTURED_REPLY", newstyle_opt_structured_reply_state_machine);
>    Group ("OPT_META_CONTEXT", newstyle_opt_meta_context_state_machine);
>    Group ("OPT_GO", newstyle_opt_go_state_machine);
> @@ -441,6 +442,46 @@ and
>    };
>  ]
> 
> +(* Fixed newstyle NBD_OPT_EXTENDED_HEADERS option.
> + * Implementation: generator/states-newstyle-opt-extended-headers.c
> + *)
> +and newstyle_opt_extended_headers_state_machine = [
> +  State {
> +    default_state with
> +    name = "START";
> +    comment = "Try to negotiate newstyle NBD_OPT_EXTENDED_HEADERS";
> +    external_events = [];
> +  };
> +
> +  State {
> +    default_state with
> +    name = "SEND";
> +    comment = "Send newstyle NBD_OPT_EXTENDED_HEADERS negotiation request";
> +    external_events = [ NotifyWrite, "" ];
> +  };
> +
> +  State {
> +    default_state with
> +    name = "RECV_REPLY";
> +    comment = "Receive newstyle NBD_OPT_EXTENDED_HEADERS option reply";
> +    external_events = [ NotifyRead, "" ];
> +  };
> +
> +  State {
> +    default_state with
> +    name = "RECV_REPLY_PAYLOAD";
> +    comment = "Receive any newstyle NBD_OPT_EXTENDED_HEADERS reply payload";
> +    external_events = [ NotifyRead, "" ];
> +  };
> +
> +  State {
> +    default_state with
> +    name = "CHECK_REPLY";
> +    comment = "Check newstyle NBD_OPT_EXTENDED_HEADERS option reply";
> +    external_events = [];
> +  };
> +]
> +
>  (* Fixed newstyle NBD_OPT_STRUCTURED_REPLY option.
>   * Implementation: generator/states-newstyle-opt-structured-reply.c
>   *)
> diff --git a/generator/states-newstyle-opt-extended-headers.c b/generator/states-newstyle-opt-extended-headers.c
> new file mode 100644
> index 00000000..1ec25e97
> --- /dev/null
> +++ b/generator/states-newstyle-opt-extended-headers.c
> @@ -0,0 +1,94 @@
> +/* nbd client library in userspace: state machine
> + * Copyright Red Hat
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, write to the Free Software
> + * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
> + */
> +
> +/* State machine for negotiating NBD_OPT_EXTENDED_HEADERS. */
> +
> +STATE_MACHINE {
> + NEWSTYLE.OPT_EXTENDED_HEADERS.START:
> +  assert (h->gflags & LIBNBD_HANDSHAKE_FLAG_FIXED_NEWSTYLE);
> +  assert (h->opt_current != NBD_OPT_EXTENDED_HEADERS);
> +  assert (CALLBACK_IS_NULL (h->opt_cb.completion));
> +  if (!h->request_eh || !h->request_sr) {
> +    SET_NEXT_STATE (%^OPT_STRUCTURED_REPLY.START);
> +    return 0;
> +  }
> +
> +  h->sbuf.option.version = htobe64 (NBD_NEW_VERSION);
> +  h->sbuf.option.option = htobe32 (NBD_OPT_EXTENDED_HEADERS);
> +  h->sbuf.option.optlen = htobe32 (0);
> +  h->chunks_sent++;
> +  h->wbuf = &h->sbuf;
> +  h->wlen = sizeof h->sbuf.option;
> +  SET_NEXT_STATE (%SEND);
> +  return 0;
> +
> + NEWSTYLE.OPT_EXTENDED_HEADERS.SEND:
> +  switch (send_from_wbuf (h)) {
> +  case -1: SET_NEXT_STATE (%.DEAD); return 0;
> +  case 0:
> +    h->rbuf = &h->sbuf;
> +    h->rlen = sizeof h->sbuf.or.option_reply;
> +    SET_NEXT_STATE (%RECV_REPLY);
> +  }
> +  return 0;
> +
> + NEWSTYLE.OPT_EXTENDED_HEADERS.RECV_REPLY:
> +  switch (recv_into_rbuf (h)) {
> +  case -1: SET_NEXT_STATE (%.DEAD); return 0;
> +  case 0:
> +    if (prepare_for_reply_payload (h, NBD_OPT_EXTENDED_HEADERS) == -1) {
> +      SET_NEXT_STATE (%.DEAD);
> +      return 0;
> +    }
> +    SET_NEXT_STATE (%RECV_REPLY_PAYLOAD);
> +  }
> +  return 0;
> +
> + NEWSTYLE.OPT_EXTENDED_HEADERS.RECV_REPLY_PAYLOAD:
> +  switch (recv_into_rbuf (h)) {
> +  case -1: SET_NEXT_STATE (%.DEAD); return 0;
> +  case 0:  SET_NEXT_STATE (%CHECK_REPLY);
> +  }
> +  return 0;
> +
> + NEWSTYLE.OPT_EXTENDED_HEADERS.CHECK_REPLY:
> +  uint32_t reply;
> +
> +  reply = be32toh (h->sbuf.or.option_reply.reply);
> +  switch (reply) {
> +  case NBD_REP_ACK:
> +    debug (h, "negotiated extended headers on this connection");
> +    h->extended_headers = true;
> +    /* Extended headers trump structured replies, so skip ahead. */
> +    h->structured_replies = true;
> +    break;
> +  default:
> +    if (handle_reply_error (h) == -1) {
> +      SET_NEXT_STATE (%.DEAD);
> +      return 0;
> +    }
> +
> +    debug (h, "extended headers are not supported by this server");
> +    break;
> +  }
> +
> +  /* Next option. */
> +  SET_NEXT_STATE (%^OPT_STRUCTURED_REPLY.START);
> +  return 0;
> +
> +} /* END STATE MACHINE */
> diff --git a/generator/states-newstyle-opt-starttls.c b/generator/states-newstyle-opt-starttls.c
> index e497548c..1e2997a3 100644
> --- a/generator/states-newstyle-opt-starttls.c
> +++ b/generator/states-newstyle-opt-starttls.c
> @@ -26,7 +26,7 @@  NEWSTYLE.OPT_STARTTLS.START:
>    else {
>      /* If TLS was not requested we skip this option and go to the next one. */
>      if (h->tls == LIBNBD_TLS_DISABLE) {
> -      SET_NEXT_STATE (%^OPT_STRUCTURED_REPLY.START);
> +      SET_NEXT_STATE (%^OPT_EXTENDED_HEADERS.START);
>        return 0;
>      }
>      assert (CALLBACK_IS_NULL (h->opt_cb.completion));
> @@ -128,7 +128,7 @@  NEWSTYLE.OPT_STARTTLS.CHECK_REPLY:
>        SET_NEXT_STATE (%.NEGOTIATING);
>      else {
>        debug (h, "continuing with unencrypted connection");
> -      SET_NEXT_STATE (%^OPT_STRUCTURED_REPLY.START);
> +      SET_NEXT_STATE (%^OPT_EXTENDED_HEADERS.START);
>      }
>      return 0;
>    }
> @@ -185,7 +185,7 @@  NEWSTYLE.OPT_STARTTLS.TLS_HANDSHAKE_DONE:
>    if (h->opt_current == NBD_OPT_STARTTLS)
>      SET_NEXT_STATE (%.NEGOTIATING);
>    else
> -    SET_NEXT_STATE (%^OPT_STRUCTURED_REPLY.START);
> +    SET_NEXT_STATE (%^OPT_EXTENDED_HEADERS.START);
>    return 0;
> 
>  } /* END STATE MACHINE */

Seems pretty straightforward.  We add a new state machine between
NEWSTYLE.OPT_STARTTLS and NEWSTYLE.OPT_STRUCTURED_REPLY which sends
the new extended headers option (if enabled).

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top

