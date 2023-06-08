Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9B5727BC6
	for <lists+nbd@lfdr.de>; Thu,  8 Jun 2023 11:44:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1D5FA204D8; Thu,  8 Jun 2023 09:44:53 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun  8 09:44:53 2023
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
	by bendel.debian.org (Postfix) with ESMTP id 3A4B8204D6
	for <lists-other-nbd@bendel.debian.org>; Thu,  8 Jun 2023 09:44:39 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.091 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ItqRW37LVuGF for <lists-other-nbd@bendel.debian.org>;
	Thu,  8 Jun 2023 09:44:29 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 0672B204CA
	for <nbd@other.debian.org>; Thu,  8 Jun 2023 09:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686217464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C1TMrr9apRt4xiqcXHtZvfPpXqDHonylTnU1i49Bwdw=;
	b=e8RLjMwKMSV6ASjw3wks/i6zmVxIbS67/zwC06htUxseTi5C8r00SolkLDwyarLakJvSX+
	LOLAz4/XnnSwL+uaylbrIuR5l6BnTPpfxW0O+zW5flkrH4PJjRlsvtJFtqrNih/tESFzet
	MvrR6UZuxMpjh6iaFqPJk5bt/sSHjuE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-njhNXNPkMCqp_52uvgDK4A-1; Thu, 08 Jun 2023 05:44:20 -0400
X-MC-Unique: njhNXNPkMCqp_52uvgDK4A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27EA93C13505;
	Thu,  8 Jun 2023 09:44:20 +0000 (UTC)
Received: from localhost (unknown [10.39.192.206])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BE66D40D1B66;
	Thu,  8 Jun 2023 09:44:19 +0000 (UTC)
Date: Thu, 8 Jun 2023 10:44:19 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: libguestfs@redhat.com, qemu-block@nongnu.org, nbd@other.debian.org
Subject: Re: [libnbd PATCH v3 19/22] api: Add nbd_[aio_]opt_extended_headers()
Message-ID: <20230608094419.GP7773@redhat.com>
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-20-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230525130108.757242-20-eblake@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <zEE8KIQoWvE.A.qDC.VMagkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2538
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230608094419.GP7773@redhat.com
Resent-Date: Thu,  8 Jun 2023 09:44:53 +0000 (UTC)

On Thu, May 25, 2023 at 08:01:05AM -0500, Eric Blake wrote:
> Very similar to the recent addition of nbd_opt_structured_reply,
> giving us fine-grained control over an extended headers request.
> 
> Because nbdkit does not yet support extended headers, testsuite
> coverage is limited to interop testing with qemu-nbd.  It shows that
> extended headers imply structured replies, regardless of which order
> the two are manually negotiated in.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  generator/API.ml                              |  79 +++++++--
>  .../states-newstyle-opt-extended-headers.c    |  30 +++-
>  generator/states-newstyle.c                   |   3 +
>  lib/opt.c                                     |  44 +++++
>  interop/Makefile.am                           |   6 +
>  interop/opt-extended-headers.c                | 153 ++++++++++++++++++
>  interop/opt-extended-headers.sh               |  29 ++++
>  .gitignore                                    |   1 +
>  8 files changed, 329 insertions(+), 16 deletions(-)
>  create mode 100644 interop/opt-extended-headers.c
>  create mode 100755 interop/opt-extended-headers.sh
> 
> diff --git a/generator/API.ml b/generator/API.ml
> index 078f140f..85625bbd 100644
> --- a/generator/API.ml
> +++ b/generator/API.ml
> @@ -825,6 +825,7 @@   "set_request_extended_headers", {
>  if L<nbd_set_request_structured_replies(3)> is also set to false,
>  since the use of extended headers implies structured replies.";
>      see_also = [Link "get_request_extended_headers";
> +                Link "opt_extended_headers";
>                  Link "set_handshake_flags"; Link "set_strict_mode";
>                  Link "get_extended_headers_negotiated";
>                  Link "zero"; Link "trim"; Link "cache";
> @@ -856,7 +857,9 @@   "get_extended_headers_negotiated", {
>      shortdesc = "see if extended headers are in use";
>      longdesc = "\
>  After connecting you may call this to find out if the connection is
> -using extended headers.
> +using extended headers.  Note that this setting is sticky; this
> +can return true even after a second L<nbd_opt_extended_headers(3)>
> +returns false because the server detected a duplicate request.
> 
>  When extended headers are not in use, commands are limited to a
>  32-bit length, even when the libnbd API uses a 64-bit parameter
> @@ -938,7 +941,7 @@   "get_structured_replies_negotiated", {
>  attempted.";
>      see_also = [Link "set_request_structured_replies";
>                  Link "get_request_structured_replies";
> -                Link "opt_structured_reply";
> +                Link "opt_structured_reply"; Link "opt_extended_headers";
>                  Link "get_protocol";
>                  Link "get_extended_headers_negotiated"];
>    };
> @@ -1211,12 +1214,13 @@   "set_opt_mode", {
>  newstyle server.  This setting has no effect when connecting to an
>  oldstyle server.
> 
> -Note that libnbd defaults to attempting C<NBD_OPT_STARTTLS> and
> -C<NBD_OPT_STRUCTURED_REPLY> before letting you control remaining
> -negotiation steps; if you need control over these steps as well,
> -first set L<nbd_set_tls(3)> to C<LIBNBD_TLS_DISABLE> and
> -L<nbd_set_request_structured_replies(3)> to false before starting
> -the connection attempt.
> +Note that libnbd defaults to attempting C<NBD_OPT_STARTTLS>,
> +C<NBD_OPT_EXTENDED_HEADERS>, and C<NBD_OPT_STRUCTURED_REPLY>
> +before letting you control remaining negotiation steps; if you
> +need control over these steps as well, first set L<nbd_set_tls(3)>
> +to C<LIBNBD_TLS_DISABLE>, and L<nbd_set_request_extended_headers(3)>
> +or L<nbd_set_request_structured_replies(3)> to false, before
> +starting the connection attempt.
> 
>  When option mode is enabled, you have fine-grained control over which
>  options are negotiated, compared to the default of the server
> @@ -1324,6 +1328,35 @@   "opt_starttls", {
>                  Link "supports_tls"]
>    };
> 
> +  "opt_extended_headers", {
> +    default_call with
> +    args = []; ret = RBool;
> +    permitted_states = [ Negotiating ];
> +    shortdesc = "request the server to enable extended headers";
> +    longdesc = "\
> +Request that the server use extended headers, by sending
> +C<NBD_OPT_EXTENDED_HEADERS>.  This can only be used if
> +L<nbd_set_opt_mode(3)> enabled option mode; furthermore, libnbd
> +defaults to automatically requesting this unless you use
> +L<nbd_set_request_extended_headers(3)> or
> +L<nbd_set_request_structured_replies(3)> prior to connecting.
> +This function is mainly useful for integration testing of corner
> +cases in server handling.
> +
> +This function returns true if the server replies with success,
> +false if the server replies with an error, and fails only if
> +the server does not reply (such as for a loss of connection).
> +Note that some servers fail a second request as redundant;
> +libnbd assumes that once one request has succeeded, then
> +extended headers are supported (as visible by
> +L<nbd_get_extended_headers_negotiated(3)>) regardless if
> +later calls to this function return false.  If this function
> +returns true, the use of structured replies is implied.";
> +    see_also = [Link "set_opt_mode"; Link "aio_opt_extended_headers";
> +                Link "opt_go"; Link "set_request_extended_headers";
> +                Link "set_request_structured_replies"]
> +  };
> +
>    "opt_structured_reply", {
>      default_call with
>      args = []; ret = RBool;
> @@ -1345,7 +1378,9 @@   "opt_structured_reply", {
>  libnbd assumes that once one request has succeeded, then
>  structured replies are supported (as visible by
>  L<nbd_get_structured_replies_negotiated(3)>) regardless if
> -later calls to this function return false.";
> +later calls to this function return false.  Similarly, a
> +server may fail this request if extended headers are already
> +negotiated, since extended headers take priority.";
>      see_also = [Link "set_opt_mode"; Link "aio_opt_structured_reply";
>                  Link "opt_go"; Link "set_request_structured_replies"]
>    };
> @@ -3146,6 +3181,30 @@   "aio_opt_starttls", {
>      see_also = [Link "set_opt_mode"; Link "opt_starttls"];
>    };
> 
> +  "aio_opt_extended_headers", {
> +    default_call with
> +    args = [];
> +    optargs = [ OClosure completion_closure ];
> +    ret = RErr;
> +    permitted_states = [ Negotiating ];
> +    shortdesc = "request the server to enable extended headers";
> +    longdesc = "\
> +Request that the server use extended headers, by sending
> +C<NBD_OPT_EXTENDED_HEADERS>.  This behaves like the synchronous
> +counterpart L<nbd_opt_extended_headers(3)>, except that it does
> +not wait for the server's response.
> +
> +To determine when the request completes, wait for
> +L<nbd_aio_is_connecting(3)> to return false.  Or supply the optional
> +C<completion_callback> which will be invoked as described in
> +L<libnbd(3)/Completion callbacks>, except that it is automatically
> +retired regardless of return value.  Note that detecting whether the
> +server returns an error (as is done by the return value of the
> +synchronous counterpart) is only possible with a completion
> +callback.";
> +    see_also = [Link "set_opt_mode"; Link "opt_extended_headers"];
> +  };
> +
>    "aio_opt_structured_reply", {
>      default_call with
>      args = [];
> @@ -4122,6 +4181,8 @@ let first_version =
>    "set_request_extended_headers", (1, 18);
>    "get_request_extended_headers", (1, 18);
>    "get_extended_headers_negotiated", (1, 18);
> +  "opt_extended_headers", (1, 18);
> +  "aio_opt_extended_headers", (1, 18);
> 
>    (* These calls are proposed for a future version of libnbd, but
>     * have not been added to any released version so far.
> diff --git a/generator/states-newstyle-opt-extended-headers.c b/generator/states-newstyle-opt-extended-headers.c
> index 1ec25e97..5017a629 100644
> --- a/generator/states-newstyle-opt-extended-headers.c
> +++ b/generator/states-newstyle-opt-extended-headers.c
> @@ -21,11 +21,14 @@
>  STATE_MACHINE {
>   NEWSTYLE.OPT_EXTENDED_HEADERS.START:
>    assert (h->gflags & LIBNBD_HANDSHAKE_FLAG_FIXED_NEWSTYLE);
> -  assert (h->opt_current != NBD_OPT_EXTENDED_HEADERS);
> -  assert (CALLBACK_IS_NULL (h->opt_cb.completion));
> -  if (!h->request_eh || !h->request_sr) {
> -    SET_NEXT_STATE (%^OPT_STRUCTURED_REPLY.START);
> -    return 0;
> +  if (h->opt_current == NBD_OPT_EXTENDED_HEADERS)
> +    assert (h->opt_mode);
> +  else {
> +    assert (CALLBACK_IS_NULL (h->opt_cb.completion));
> +    if (!h->request_eh || !h->request_sr) {
> +      SET_NEXT_STATE (%^OPT_STRUCTURED_REPLY.START);
> +      return 0;
> +    }
>    }
> 
>    h->sbuf.option.version = htobe64 (NBD_NEW_VERSION);
> @@ -68,6 +71,7 @@  NEWSTYLE.OPT_EXTENDED_HEADERS.RECV_REPLY_PAYLOAD:
> 
>   NEWSTYLE.OPT_EXTENDED_HEADERS.CHECK_REPLY:
>    uint32_t reply;
> +  int err = ENOTSUP;
> 
>    reply = be32toh (h->sbuf.or.option_reply.reply);
>    switch (reply) {
> @@ -76,19 +80,31 @@  NEWSTYLE.OPT_EXTENDED_HEADERS.CHECK_REPLY:
>      h->extended_headers = true;
>      /* Extended headers trump structured replies, so skip ahead. */
>      h->structured_replies = true;
> +    err = 0;
>      break;
> +  case NBD_REP_ERR_INVALID:
> +    err = EINVAL;
> +    /* fallthrough */
>    default:
>      if (handle_reply_error (h) == -1) {
>        SET_NEXT_STATE (%.DEAD);
>        return 0;
>      }
> 
> -    debug (h, "extended headers are not supported by this server");
> +    if (h->extended_headers)
> +      debug (h, "extended headers already negotiated");
> +    else
> +      debug (h, "extended headers are not supported by this server");
>      break;
>    }
> 
>    /* Next option. */
> -  SET_NEXT_STATE (%^OPT_STRUCTURED_REPLY.START);
> +  if (h->opt_current == NBD_OPT_EXTENDED_HEADERS)
> +    SET_NEXT_STATE (%.NEGOTIATING);
> +  else
> +    SET_NEXT_STATE (%^OPT_STRUCTURED_REPLY.START);
> +  CALL_CALLBACK (h->opt_cb.completion, &err);
> +  nbd_internal_free_option (h);
>    return 0;
> 
>  } /* END STATE MACHINE */
> diff --git a/generator/states-newstyle.c b/generator/states-newstyle.c
> index ad5bbf72..45893a8b 100644
> --- a/generator/states-newstyle.c
> +++ b/generator/states-newstyle.c
> @@ -146,6 +146,9 @@  NEWSTYLE.START:
>      case NBD_OPT_STRUCTURED_REPLY:
>        SET_NEXT_STATE (%OPT_STRUCTURED_REPLY.START);
>        return 0;
> +    case NBD_OPT_EXTENDED_HEADERS:
> +      SET_NEXT_STATE (%OPT_EXTENDED_HEADERS.START);
> +      return 0;
>      case NBD_OPT_STARTTLS:
>        SET_NEXT_STATE (%OPT_STARTTLS.START);
>        return 0;
> diff --git a/lib/opt.c b/lib/opt.c
> index f58d5e19..d48acdd1 100644
> --- a/lib/opt.c
> +++ b/lib/opt.c
> @@ -164,6 +164,31 @@ nbd_unlocked_opt_starttls (struct nbd_handle *h)
>    return r;
>  }
> 
> +/* Issue NBD_OPT_EXTENDED_HEADERS and wait for the reply. */
> +int
> +nbd_unlocked_opt_extended_headers (struct nbd_handle *h)
> +{
> +  int err;
> +  nbd_completion_callback c = { .callback = go_complete, .user_data = &err };
> +  int r = nbd_unlocked_aio_opt_extended_headers (h, &c);
> +
> +  if (r == -1)
> +    return r;
> +
> +  r = wait_for_option (h);
> +  if (r == 0) {
> +    if (nbd_internal_is_state_negotiating (get_next_state (h)))
> +      r = err == 0;
> +    else {
> +      assert (nbd_internal_is_state_dead (get_next_state (h)));
> +      set_error (err,
> +                 "failed to get response to opt_extended_headers request");
> +      r = -1;
> +    }
> +  }
> +  return r;
> +}
> +
>  /* Issue NBD_OPT_STRUCTURED_REPLY and wait for the reply. */
>  int
>  nbd_unlocked_opt_structured_reply (struct nbd_handle *h)
> @@ -386,6 +411,25 @@ nbd_unlocked_aio_opt_starttls (struct nbd_handle *h,
>  #endif
>  }
> 
> +/* Issue NBD_OPT_EXTENDED_HEADERS without waiting. */
> +int
> +nbd_unlocked_aio_opt_extended_headers (struct nbd_handle *h,
> +                                       nbd_completion_callback *complete)
> +{
> +  if ((h->gflags & LIBNBD_HANDSHAKE_FLAG_FIXED_NEWSTYLE) == 0) {
> +    set_error (ENOTSUP, "server is not using fixed newstyle protocol");
> +    return -1;
> +  }
> +
> +  h->opt_current = NBD_OPT_EXTENDED_HEADERS;
> +  h->opt_cb.completion = *complete;
> +  SET_CALLBACK_TO_NULL (*complete);
> +
> +  if (nbd_internal_run (h, cmd_issue) == -1)
> +    debug (h, "option queued, ignoring state machine failure");
> +  return 0;
> +}
> +
>  /* Issue NBD_OPT_STRUCTURED_REPLY without waiting. */
>  int
>  nbd_unlocked_aio_opt_structured_reply (struct nbd_handle *h,
> diff --git a/interop/Makefile.am b/interop/Makefile.am
> index ec8ea0b2..3f81df0c 100644
> --- a/interop/Makefile.am
> +++ b/interop/Makefile.am
> @@ -25,6 +25,7 @@ EXTRA_DIST = \
>  	list-exports-test-dir/disk1 \
>  	list-exports-test-dir/disk2 \
>  	structured-read.sh \
> +	opt-extended-headers.sh \
>  	$(NULL)
> 
>  TESTS_ENVIRONMENT = \
> @@ -134,6 +135,7 @@ check_PROGRAMS += \
>  	socket-activation-qemu-nbd \
>  	dirty-bitmap \
>  	structured-read \
> +	opt-extended-headers \
>  	$(NULL)
>  TESTS += \
>  	interop-qemu-nbd \
> @@ -144,6 +146,7 @@ TESTS += \
>  	dirty-bitmap.sh \
>  	structured-read.sh \
>  	interop-qemu-block-size.sh \
> +	opt-extended-headers.sh \
>  	$(NULL)
> 
>  interop_qemu_nbd_SOURCES = \
> @@ -235,6 +238,9 @@ dirty_bitmap_LDADD = $(top_builddir)/lib/libnbd.la
>  structured_read_SOURCES = structured-read.c
>  structured_read_LDADD = $(top_builddir)/lib/libnbd.la
> 
> +opt_extended_headers_SOURCES = opt-extended-headers.c
> +opt_extended_headers_LDADD = $(top_builddir)/lib/libnbd.la
> +
>  endif HAVE_QEMU_NBD
> 
>  #----------------------------------------------------------------------
> diff --git a/interop/opt-extended-headers.c b/interop/opt-extended-headers.c
> new file mode 100644
> index 00000000..f50cd78f
> --- /dev/null
> +++ b/interop/opt-extended-headers.c
> @@ -0,0 +1,153 @@
> +/* NBD client library in userspace
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
> +/* Demonstrate low-level use of nbd_opt_extended_headers(). */
> +
> +#include <config.h>
> +
> +#include <inttypes.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <errno.h>
> +#include <unistd.h>
> +#include <sys/stat.h>
> +
> +#include <libnbd.h>
> +
> +#define check(got, exp) do_check (#got, got, exp)
> +
> +static void
> +do_check (const char *act, int64_t got, int64_t exp)
> +{
> +  fprintf (stderr, "trying %s\n", act);
> +  if (got == -1)
> +    fprintf (stderr, "%s\n", nbd_get_error ());
> +  else
> +    fprintf (stderr, "succeeded, result %" PRId64 "\n", got);
> +  if (got != exp) {
> +    fprintf (stderr, "got %" PRId64 ", but expected %" PRId64 "\n", got, exp);
> +    exit (EXIT_FAILURE);
> +  }
> +}
> +
> +static int
> +cb (void *data, const char *metacontext, uint64_t offset,
> +         nbd_extent *entries, size_t nr_entries, int *error)
> +{
> +  /* If we got here, extents worked, implying at least structured replies */
> +  bool *seen = data;
> +
> +  *seen = true;
> +  return 0;
> +}
> +
> +struct nbd_handle *
> +prep (bool sr, bool eh, char **cmd)
> +{
> +  struct nbd_handle *nbd;
> +
> +  nbd = nbd_create ();
> +  if (nbd == NULL) {
> +    fprintf (stderr, "%s\n", nbd_get_error ());
> +    exit (EXIT_FAILURE);
> +  }
> +
> +  /* Connect to the server in opt mode, disable client-side failsafes so
> +   * that we are testing server response even when client breaks protocol.
> +   */
> +  check (nbd_set_opt_mode (nbd, true), 0);
> +  check (nbd_set_strict_mode (nbd, 0), 0);
> +  check (nbd_add_meta_context (nbd, LIBNBD_CONTEXT_BASE_ALLOCATION), 0);
> +  check (nbd_set_request_structured_replies (nbd, sr), 0);
> +  check (nbd_set_request_extended_headers (nbd, eh), 0);
> +  check (nbd_connect_systemd_socket_activation (nbd, cmd), 0);
> +
> +  return nbd;
> +}
> +
> +void
> +cleanup (struct nbd_handle *nbd, bool extents_exp)
> +{
> +  bool extents = false;
> +
> +  check (nbd_opt_go (nbd), 0);
> +  check (nbd_can_meta_context (nbd, LIBNBD_CONTEXT_BASE_ALLOCATION),
> +         extents_exp);
> +  check (nbd_block_status_64 (nbd, 512, 0,
> +                              (nbd_extent64_callback) { .callback = cb,
> +                                                        .user_data = &extents },
> +                              0), extents_exp ? 0 : -1);
> +  check (extents, extents_exp);
> +  nbd_close (nbd);
> +}
> +
> +int
> +main (int argc, char *argv[])
> +{
> +  struct nbd_handle *nbd;
> +  int64_t bytes_sent;
> +
> +  if (argc < 2) {
> +    fprintf (stderr, "%s qemu-nbd [args ...]\n", argv[0]);
> +    exit (EXIT_FAILURE);
> +  }
> +
> +  /* Default setup tries eh first, and skips sr request when eh works... */
> +  nbd = prep (true, true, &argv[1]);
> +  bytes_sent = nbd_stats_bytes_sent (nbd);
> +  check (nbd_get_extended_headers_negotiated (nbd), true);
> +  check (nbd_get_structured_replies_negotiated (nbd), true);
> +  /* Duplicate eh request is no-op as redundant, but does not change state */
> +  check (nbd_opt_extended_headers (nbd), false);
> +  /* Trying sr after eh is no-op as redundant, but does not change state */
> +  check (nbd_opt_structured_reply (nbd), false);
> +  check (nbd_get_extended_headers_negotiated (nbd), true);
> +  check (nbd_get_structured_replies_negotiated (nbd), true);
> +  cleanup (nbd, true);
> +
> +  /* ...which should result in the same amount of initial negotiation
> +   * traffic as explicitly requesting just structured replies, albeit
> +   * with different results on what got negotiated.
> +   */
> +  nbd = prep (true, false, &argv[1]);
> +  check (nbd_stats_bytes_sent (nbd), bytes_sent);
> +  check (nbd_get_extended_headers_negotiated (nbd), false);
> +  check (nbd_get_structured_replies_negotiated (nbd), true);
> +  cleanup (nbd, true);
> +
> +  /* request_eh is ignored if request_sr is false. */
> +  nbd = prep (false, true, &argv[1]);
> +  check (nbd_get_extended_headers_negotiated (nbd), false);
> +  check (nbd_get_structured_replies_negotiated (nbd), false);
> +  cleanup (nbd, false);
> +
> +  /* Swap order, requesting structured replies before extended headers */
> +  nbd = prep (false, false, &argv[1]);
> +  check (nbd_get_extended_headers_negotiated (nbd), false);
> +  check (nbd_get_structured_replies_negotiated (nbd), false);
> +  check (nbd_opt_structured_reply (nbd), true);
> +  check (nbd_get_extended_headers_negotiated (nbd), false);
> +  check (nbd_get_structured_replies_negotiated (nbd), true);
> +  check (nbd_opt_extended_headers (nbd), true);
> +  check (nbd_get_extended_headers_negotiated (nbd), true);
> +  check (nbd_get_structured_replies_negotiated (nbd), true);
> +  cleanup (nbd, true);
> +
> +  exit (EXIT_SUCCESS);
> +}
> diff --git a/interop/opt-extended-headers.sh b/interop/opt-extended-headers.sh
> new file mode 100755
> index 00000000..41322f36
> --- /dev/null
> +++ b/interop/opt-extended-headers.sh
> @@ -0,0 +1,29 @@
> +#!/usr/bin/env bash
> +# nbd client library in userspace
> +# Copyright Red Hat
> +#
> +# This library is free software; you can redistribute it and/or
> +# modify it under the terms of the GNU Lesser General Public
> +# License as published by the Free Software Foundation; either
> +# version 2 of the License, or (at your option) any later version.
> +#
> +# This library is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> +# Lesser General Public License for more details.
> +#
> +# You should have received a copy of the GNU Lesser General Public
> +# License along with this library; if not, write to the Free Software
> +# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
> +
> +# Test low-level nbd_opt_extended_headers() details with qemu-nbd
> +
> +source ../tests/functions.sh
> +set -e
> +set -x
> +
> +requires qemu-nbd --version
> +requires nbdinfo --can extended-headers -- [ qemu-nbd -r -f raw "$0" ]
> +
> +# Run the test.
> +$VG ./opt-extended-headers qemu-nbd -r -f raw "$0"
> diff --git a/.gitignore b/.gitignore
> index bc7c2c37..24642748 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -118,6 +118,7 @@ Makefile.in
>  /interop/list-exports-nbdkit
>  /interop/list-exports-qemu-nbd
>  /interop/nbd-server-tls.conf
> +/interop/opt-extended-headers
>  /interop/requires.c
>  /interop/socket-activation-nbdkit
>  /interop/socket-activation-qemu-nbd

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top

