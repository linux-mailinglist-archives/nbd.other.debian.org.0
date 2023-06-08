Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 319B6727BE1
	for <lists+nbd@lfdr.de>; Thu,  8 Jun 2023 11:49:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D3724204D8; Thu,  8 Jun 2023 09:49:52 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun  8 09:49:52 2023
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE,WORD_WITHOUT_VOWELS autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7725E204D6
	for <lists-other-nbd@bendel.debian.org>; Thu,  8 Jun 2023 09:49:39 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.091 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id nXXAXVzIDIEd for <lists-other-nbd@bendel.debian.org>;
	Thu,  8 Jun 2023 09:49:29 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 706F92048F
	for <nbd@other.debian.org>; Thu,  8 Jun 2023 09:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686217764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fCkoSj5ufuWex1shx5tK5kJLF/5wl4fsISBA/uoX0U0=;
	b=giu1HRVYDXTGV843usMrTWbY7qb1ZbkzmsOPcFMo6x9NqHDLlhoM0g2roYJJlceai8vU8i
	Nm3AZL+2H7zcpiBUHqUksOC6AqeB/Nh6FHmPZRNx8ibileEr0FxfRPiJidPpTL9Yb4y+/I
	U3YIkATjJ/BbiY/phRAuS1cm8JsHPJc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-VUwZa0mRPuKD_QOmvfcC8w-1; Thu, 08 Jun 2023 05:49:21 -0400
X-MC-Unique: VUwZa0mRPuKD_QOmvfcC8w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B0D0101AA44;
	Thu,  8 Jun 2023 09:49:21 +0000 (UTC)
Received: from localhost (unknown [10.39.192.206])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 27063C034A3;
	Thu,  8 Jun 2023 09:49:18 +0000 (UTC)
Date: Thu, 8 Jun 2023 10:49:17 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: libguestfs@redhat.com, qemu-block@nongnu.org, nbd@other.debian.org
Subject: Re: [libnbd PATCH v3 21/22] api: Add nbd_can_block_status_payload()
Message-ID: <20230608094917.GR7773@redhat.com>
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-22-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230525130108.757242-22-eblake@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <qB5AY1SPCHH.A.fwC.ARagkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2540
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230608094917.GR7773@redhat.com
Resent-Date: Thu,  8 Jun 2023 09:49:52 +0000 (UTC)

On Thu, May 25, 2023 at 08:01:07AM -0500, Eric Blake wrote:
> In the recent NBD protocol extensions to add 64-bit commands [1], an
> additional option was added to allow NBD_CMD_BLOCK_STATUS pass a

to pass

> client payload instructing the server to filter its answers in nbd.git
> commit e6f3b94a (mainly useful when the client requests more than one
> meta context with NBD_OPT_SET_META_CONTEXT).  This patch lays the
> groundwork by exposing servers that advertise this capability,
> although libnbd does not yet actually utilize it until the next patch.
> 
> At the time this patch was written, qemu-nbd was also patched to
> provide such support; hence, an interop/ test shows the API in action.
> 
> [1] https://github.com/NetworkBlockDevice/nbd/blob/extension-ext-header/doc/
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  info/nbdinfo.pod                |  10 ++-
>  lib/nbd-protocol.h              |  29 +++++---
>  generator/API.ml                |  18 +++++
>  lib/flags.c                     |  12 +++
>  examples/server-flags.c         |   7 +-
>  interop/Makefile.am             |   6 ++
>  interop/block-status-payload.c  | 126 ++++++++++++++++++++++++++++++++
>  interop/block-status-payload.sh |  68 +++++++++++++++++
>  .gitignore                      |   1 +
>  info/can.c                      |   5 ++
>  info/show.c                     |   9 ++-
>  11 files changed, 274 insertions(+), 17 deletions(-)
>  create mode 100644 interop/block-status-payload.c
>  create mode 100755 interop/block-status-payload.sh
> 
> diff --git a/info/nbdinfo.pod b/info/nbdinfo.pod
> index 9ea4a278..f5dc53fa 100644
> --- a/info/nbdinfo.pod
> +++ b/info/nbdinfo.pod
> @@ -178,6 +178,8 @@ rotating disk: accessing nearby blocks may be faster than random
>  access and requests should be sorted to improve performance.  Many
>  servers do not or cannot report this accurately.
> 
> +=item nbdinfo --can block-status-payload URI

Another case where "--has" sounds better ...

>  =item nbdinfo --can cache URI
> 
>  =item nbdinfo --can df URI
> @@ -345,10 +347,10 @@ The command does not print anything.  Instead it exits with success
> 
>  For further information see the L<NBD
>  protocol|https://github.com/NetworkBlockDevice/nbd/blob/master/doc/proto.md>
> -and the following libnbd functions: L<nbd_can_cache(3)>,
> -L<nbd_can_df(3)>, L<nbd_can_fast_zero(3)>, L<nbd_can_flush(3)>,
> -L<nbd_can_fua(3)>, L<nbd_can_multi_conn(3)>, L<nbd_can_trim(3)>,
> -L<nbd_can_zero(3)>, L<nbd_is_read_only(3)>,
> +and the following libnbd functions: L<nbd_can_block_status_payload(3)>,
> +L<nbd_can_cache(3)>, L<nbd_can_df(3)>, L<nbd_can_fast_zero(3)>,
> +L<nbd_can_flush(3)>, L<nbd_can_fua(3)>, L<nbd_can_multi_conn(3)>,
> +L<nbd_can_trim(3)>, L<nbd_can_zero(3)>, L<nbd_is_read_only(3)>,
>  L<nbd_get_structured_replies_negotiated(3)>,
>  L<nbd_get_extended_headers_negotiated(3)>.
> 
> diff --git a/lib/nbd-protocol.h b/lib/nbd-protocol.h
> index b6fa9b8a..9e358122 100644
> --- a/lib/nbd-protocol.h
> +++ b/lib/nbd-protocol.h
> @@ -102,17 +102,18 @@ struct nbd_fixed_new_option_reply {
>  #define NBD_FLAG_NO_ZEROES         (1 << 1)
> 
>  /* Per-export flags. */
> -#define NBD_FLAG_HAS_FLAGS         (1 << 0)
> -#define NBD_FLAG_READ_ONLY         (1 << 1)
> -#define NBD_FLAG_SEND_FLUSH        (1 << 2)
> -#define NBD_FLAG_SEND_FUA          (1 << 3)
> -#define NBD_FLAG_ROTATIONAL        (1 << 4)
> -#define NBD_FLAG_SEND_TRIM         (1 << 5)
> -#define NBD_FLAG_SEND_WRITE_ZEROES (1 << 6)
> -#define NBD_FLAG_SEND_DF           (1 << 7)
> -#define NBD_FLAG_CAN_MULTI_CONN    (1 << 8)
> -#define NBD_FLAG_SEND_CACHE        (1 << 10)
> -#define NBD_FLAG_SEND_FAST_ZERO    (1 << 11)
> +#define NBD_FLAG_HAS_FLAGS            (1 << 0)
> +#define NBD_FLAG_READ_ONLY            (1 << 1)
> +#define NBD_FLAG_SEND_FLUSH           (1 << 2)
> +#define NBD_FLAG_SEND_FUA             (1 << 3)
> +#define NBD_FLAG_ROTATIONAL           (1 << 4)
> +#define NBD_FLAG_SEND_TRIM            (1 << 5)
> +#define NBD_FLAG_SEND_WRITE_ZEROES    (1 << 6)
> +#define NBD_FLAG_SEND_DF              (1 << 7)
> +#define NBD_FLAG_CAN_MULTI_CONN       (1 << 8)
> +#define NBD_FLAG_SEND_CACHE           (1 << 10)
> +#define NBD_FLAG_SEND_FAST_ZERO       (1 << 11)
> +#define NBD_FLAG_BLOCK_STATUS_PAYLOAD (1 << 12)
> 
>  /* NBD options (new style handshake only). */
>  #define NBD_OPT_EXPORT_NAME        1
> @@ -204,6 +205,12 @@ struct nbd_request_ext {
>    uint64_t count;               /* Request effect or payload length. */
>  } NBD_ATTRIBUTE_PACKED;
> 
> +/* Extended request payload for NBD_CMD_BLOCK_STATUS, when supported. */
> +struct nbd_block_status_payload {
> +  uint64_t length;              /* Effective length of client request */
> +  /* followed by array of uint32_t ids */
> +} NBD_ATTRIBUTE_PACKED;
> +
>  /* Simple reply (server -> client). */
>  struct nbd_simple_reply {
>    uint32_t magic;               /* NBD_SIMPLE_REPLY_MAGIC. */
> diff --git a/generator/API.ml b/generator/API.ml
> index 85625bbd..5a31ce3b 100644
> --- a/generator/API.ml
> +++ b/generator/API.ml
> @@ -2327,6 +2327,23 @@   "can_fast_zero", {
>      example = Some "examples/server-flags.c";
>    };
> 
> +  "can_block_status_payload", {
> +    default_call with
> +    args = []; ret = RBool;
> +    permitted_states = [ Negotiating; Connected; Closed ];
> +    shortdesc = "does the server support the block status payload flag?";
> +    longdesc = "\
> +Returns true if the server supports the use of the
> +C<LIBNBD_CMD_FLAG_PAYLOAD_LEN> flag to allow filtering of the
> +block status command.  Returns
> +false if the server does not.  Note that this will never return
> +true if L<nbd_get_extended_headers_negotiated(3)> is false."
> +^ non_blocking_test_call_description;
> +    see_also = [SectionLink "Flag calls"; Link "opt_info";
> +                Link "get_extended_headers_negotiated"];
> +    example = Some "examples/server-flags.c";
> +  };
> +
>    "can_df", {
>      default_call with
>      args = []; ret = RBool;
> @@ -4183,6 +4200,7 @@ let first_version =
>    "get_extended_headers_negotiated", (1, 18);
>    "opt_extended_headers", (1, 18);
>    "aio_opt_extended_headers", (1, 18);
> +  "can_block_status_payload", (1, 18);
> 
>    (* These calls are proposed for a future version of libnbd, but
>     * have not been added to any released version so far.
> diff --git a/lib/flags.c b/lib/flags.c
> index be880acf..7e6ddedd 100644
> --- a/lib/flags.c
> +++ b/lib/flags.c
> @@ -66,6 +66,12 @@ nbd_internal_set_size_and_flags (struct nbd_handle *h,
>      eflags &= ~NBD_FLAG_SEND_DF;
>    }
> 
> +  if (eflags & NBD_FLAG_BLOCK_STATUS_PAYLOAD && !h->extended_headers) {
> +    debug (h, "server lacks extended headers, ignoring claim "
> +           "of block status payload");
> +    eflags &= ~NBD_FLAG_BLOCK_STATUS_PAYLOAD;
> +  }
> +
>    if (eflags & NBD_FLAG_SEND_FAST_ZERO &&
>        !(eflags & NBD_FLAG_SEND_WRITE_ZEROES)) {
>      debug (h, "server lacks write zeroes, ignoring claim of fast zero");
> @@ -213,6 +219,12 @@ nbd_unlocked_can_cache (struct nbd_handle *h)
>    return get_flag (h, NBD_FLAG_SEND_CACHE);
>  }
> 
> +int
> +nbd_unlocked_can_block_status_payload (struct nbd_handle *h)
> +{
> +  return get_flag (h, NBD_FLAG_BLOCK_STATUS_PAYLOAD);
> +}
> +
>  int
>  nbd_unlocked_can_meta_context (struct nbd_handle *h, const char *name)
>  {
> diff --git a/examples/server-flags.c b/examples/server-flags.c
> index d156aced..f53b86ed 100644
> --- a/examples/server-flags.c
> +++ b/examples/server-flags.c
> @@ -78,8 +78,13 @@ main (int argc, char *argv[])
>    PRINT_FLAG (nbd_can_multi_conn);
>    PRINT_FLAG (nbd_can_trim);
>    PRINT_FLAG (nbd_can_zero);
> -#if LIBNBD_HAVE_NBD_CAN_FAST_ZERO /* Added in 1.2 */
> +#if LIBNBD_HAVE_NBD_CAN_FAST_ZERO
> +  /* Added in 1.2 */
>    PRINT_FLAG (nbd_can_fast_zero);
> +#endif
> +#if LIBNBD_HAVE_NBD_CAN_BLOCK_STATUS_PAYLOAD
> +  /* Added in 1.18 */
> +  PRINT_FLAG (nbd_can_block_status_payload);
>  #endif
>    PRINT_FLAG (nbd_is_read_only);
>    PRINT_FLAG (nbd_is_rotational);
> diff --git a/interop/Makefile.am b/interop/Makefile.am
> index 9a7a5967..f8c4cb7d 100644
> --- a/interop/Makefile.am
> +++ b/interop/Makefile.am
> @@ -27,6 +27,7 @@ EXTRA_DIST = \
>  	list-exports-test-dir/disk2 \
>  	structured-read.sh \
>  	opt-extended-headers.sh \
> +	block-status-payload.sh \
>  	$(NULL)
> 
>  TESTS_ENVIRONMENT = \
> @@ -138,6 +139,7 @@ check_PROGRAMS += \
>  	large-status \
>  	structured-read \
>  	opt-extended-headers \
> +	block-status-payload \
>  	$(NULL)
>  TESTS += \
>  	interop-qemu-nbd \
> @@ -150,6 +152,7 @@ TESTS += \
>  	structured-read.sh \
>  	interop-qemu-block-size.sh \
>  	opt-extended-headers.sh \
> +	block-status-payload.sh \
>  	$(NULL)
> 
>  interop_qemu_nbd_SOURCES = \
> @@ -247,6 +250,9 @@ structured_read_LDADD = $(top_builddir)/lib/libnbd.la
>  opt_extended_headers_SOURCES = opt-extended-headers.c
>  opt_extended_headers_LDADD = $(top_builddir)/lib/libnbd.la
> 
> +block_status_payload_SOURCES = block-status-payload.c
> +block_status_payload_LDADD = $(top_builddir)/lib/libnbd.la
> +
>  endif HAVE_QEMU_NBD
> 
>  #----------------------------------------------------------------------
> diff --git a/interop/block-status-payload.c b/interop/block-status-payload.c
> new file mode 100644
> index 00000000..9603dfe5
> --- /dev/null
> +++ b/interop/block-status-payload.c
> @@ -0,0 +1,126 @@
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
> +/* Test interaction with qemu using block status payload filtering. */
> +
> +#include <config.h>
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include <assert.h>
> +#include <stdbool.h>
> +#include <errno.h>
> +
> +#include <libnbd.h>
> +
> +#include "array-size.h"
> +
> +static const char *contexts[] = {
> +  "base:allocation",
> +  "qemu:allocation-depth",
> +  "qemu:dirty-bitmap:bitmap0",
> +  "qemu:dirty-bitmap:bitmap1",
> +};
> +
> +static int
> +cb (void *opaque, const char *metacontext, uint64_t offset,
> +    nbd_extent *entries, size_t len, int *error)
> +{
> +  /* Adjust seen according to which context was visited */
> +  unsigned int *seen = opaque;
> +  size_t i;
> +
> +  for (i = 0; i < ARRAY_SIZE (contexts); i++)
> +    if (strcmp (contexts[i], metacontext) == 0)
> +      break;
> +  *seen |= 1 << i;
> +  return 0;
> +}
> +
> +int
> +main (int argc, char *argv[])
> +{
> +  struct nbd_handle *nbd;
> +  int64_t exportsize;
> +  unsigned int seen;
> +  size_t i;
> +  int r;
> +
> +  if (argc < 2) {
> +    fprintf (stderr, "%s qemu-nbd [args ...]\n", argv[0]);
> +    exit (EXIT_FAILURE);
> +  }
> +
> +  nbd = nbd_create ();
> +  if (nbd == NULL) {
> +    fprintf (stderr, "%s\n", nbd_get_error ());
> +    exit (EXIT_FAILURE);
> +  }
> +
> +  assert (ARRAY_SIZE (contexts) == 4);
> +  for (i = 0; i < ARRAY_SIZE (contexts); i++) {
> +    if (nbd_add_meta_context (nbd, contexts[i]) == -1) {
> +      fprintf (stderr, "%s\n", nbd_get_error ());
> +      exit (EXIT_FAILURE);
> +    }
> +  }
> +
> +  if (nbd_connect_systemd_socket_activation (nbd, &argv[1]) == -1) {
> +    fprintf (stderr, "%s\n", nbd_get_error ());
> +    exit (EXIT_FAILURE);
> +  }
> +
> +  r = nbd_can_block_status_payload (nbd);
> +  if (r == -1) {
> +    fprintf (stderr, "%s\n", nbd_get_error ());
> +    exit (EXIT_FAILURE);
> +  }
> +  if (r != 1) {
> +    fprintf (stderr, "expecting block status payload support from qemu\n");
> +    exit (EXIT_FAILURE);
> +  }
> +
> +  exportsize = nbd_get_size (nbd);
> +  if (exportsize == -1) {
> +    fprintf (stderr, "%s\n", nbd_get_error ());
> +    exit (EXIT_FAILURE);
> +  }
> +
> +  /* An unfiltered call should see all four contexts */
> +  seen = 0;
> +  if (nbd_block_status_64 (nbd, exportsize, 0,
> +                           (nbd_extent64_callback) { .callback = cb,
> +                                                     .user_data = &seen },
> +                           0) == -1) {
> +    fprintf (stderr, "%s\n", nbd_get_error ());
> +    exit (EXIT_FAILURE);
> +  }
> +  assert (seen == 0xf);
> +
> +  /* FIXME: Test filtered calls once the API is added */
> +  if (nbd_shutdown (nbd, 0) == -1) {
> +    fprintf (stderr, "%s\n", nbd_get_error ());
> +    exit (EXIT_FAILURE);
> +  }
> +
> +  nbd_close (nbd);
> +
> +  exit (EXIT_SUCCESS);
> +}
> diff --git a/interop/block-status-payload.sh b/interop/block-status-payload.sh
> new file mode 100755
> index 00000000..a12cfc8a
> --- /dev/null
> +++ b/interop/block-status-payload.sh
> @@ -0,0 +1,68 @@
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
> +# Test use of block status payload for server filtering
> +
> +source ../tests/functions.sh
> +set -e
> +set -x
> +
> +requires qemu-img bitmap --help
> +# This test uses the qemu-nbd -A and -B options.
> +requires qemu-nbd -A -BA --version
> +
> +file="block-status-payload.qcow2"
> +rm -f $file
> +cleanup_fn rm -f $file
> +
> +# Create sparse file with two bitmaps.
> +qemu-img create -f qcow2 $file 1M
> +qemu-img bitmap --add --enable -f qcow2 $file bitmap0
> +qemu-img bitmap --add --enable -f qcow2 $file bitmap1
> +
> +# Unconditional part of test: qemu should not advertise block status payload
> +# support if extended headers are not in use
> +nbdsh -c '
> +h.set_request_extended_headers(False)
> +h.add_meta_context("base:allocation")
> +h.add_meta_context("qemu:allocation-depth")
> +h.add_meta_context("qemu:dirty-bitmap:bitmap0")
> +h.add_meta_context("qemu:dirty-bitmap:bitmap1")
> +h.set_opt_mode(True)
> +args = ["qemu-nbd", "-f", "qcow2", "-A", "-B", "bitmap0", "-B", "bitmap1",
> +        "'"$file"'"]
> +h.connect_systemd_socket_activation(args)
> +assert h.aio_is_negotiating() is True
> +assert h.get_extended_headers_negotiated() is False
> +# Flag not available until info or go
> +try:
> +  h.can_block_status_payload()
> +  assert False
> +except nbd.Error:
> +  pass
> +h.opt_info()
> +assert h.can_block_status_payload() is False
> +assert h.can_meta_context("base:allocation") is True
> +h.opt_abort()
> +'
> +
> +# Conditional part of test: if qemu is new enough to support extended
> +# headers, we assume it can also support block status payload.
> +requires nbdinfo --can extended-headers -- [ qemu-nbd -r -f qcow2 "$file" ]
> +$VG ./block-status-payload \
> +    qemu-nbd -f qcow2 -A -B bitmap0 -B bitmap1 $file
> diff --git a/.gitignore b/.gitignore
> index fd81357b..a2d052bd 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -101,6 +101,7 @@ Makefile.in
>  /info/nbdinfo
>  /info/nbdinfo.1
>  /install-sh
> +/interop/block-status-payload
>  /interop/dirty-bitmap
>  /interop/interop-nbd-server
>  /interop/interop-nbd-server-tls
> diff --git a/info/can.c b/info/can.c
> index 31c4a1ca..6dd68eeb 100644
> --- a/info/can.c
> +++ b/info/can.c
> @@ -72,6 +72,11 @@ do_can (void)
>    else if (strcasecmp (can, "rotational") == 0)
>      feature = nbd_is_rotational (nbd);
> 
> +  else if (strcasecmp (can, "block status payload") == 0 ||
> +           strcasecmp (can, "block-status-payload") == 0 ||
> +           strcasecmp (can, "block_status_payload") == 0)
> +    feature = nbd_can_block_status_payload (nbd);
> +
>    else if (strcasecmp (can, "cache") == 0)
>      feature = nbd_can_cache (nbd);
> 
> diff --git a/info/show.c b/info/show.c
> index 920bbb0a..8914f927 100644
> --- a/info/show.c
> +++ b/info/show.c
> @@ -54,7 +54,7 @@ show_one_export (struct nbd_handle *nbd, const char *desc,
>    char *uri = NULL;
>    int is_rotational, is_read_only;
>    int can_cache, can_df, can_fast_zero, can_flush, can_fua,
> -    can_multi_conn, can_trim, can_zero;
> +    can_multi_conn, can_trim, can_zero, can_block_status_payload;
>    int64_t block_minimum, block_preferred, block_maximum;
>    string_vector contexts = empty_vector;
>    bool show_context = false;
> @@ -120,6 +120,7 @@ show_one_export (struct nbd_handle *nbd, const char *desc,
>    can_multi_conn = nbd_can_multi_conn (nbd);
>    can_trim = nbd_can_trim (nbd);
>    can_zero = nbd_can_zero (nbd);
> +  can_block_status_payload = nbd_can_block_status_payload (nbd);
>    block_minimum = nbd_get_block_size (nbd, LIBNBD_SIZE_MINIMUM);
>    block_preferred = nbd_get_block_size (nbd, LIBNBD_SIZE_PREFERRED);
>    block_maximum = nbd_get_block_size (nbd, LIBNBD_SIZE_MAXIMUM);
> @@ -161,6 +162,8 @@ show_one_export (struct nbd_handle *nbd, const char *desc,
>      if (is_read_only >= 0)
>        fprintf (fp, "\t%s: %s\n", "is_read_only",
>                 is_read_only ? "true" : "false");
> +    if (can_block_status_payload >= 0)
> +      show_boolean ("can_block_status_payload", can_block_status_payload);
>      if (can_cache >= 0)
>        show_boolean ("can_cache", can_cache);
>      if (can_df >= 0)
> @@ -230,6 +233,10 @@ show_one_export (struct nbd_handle *nbd, const char *desc,
>      if (is_read_only >= 0)
>        fprintf (fp, "\t\"%s\": %s,\n",
>                "is_read_only", is_read_only ? "true" : "false");
> +    if (can_block_status_payload >= 0)
> +      fprintf (fp, "\t\"%s\": %s,\n",
> +              "can_block_status_payload",
> +               can_block_status_payload ? "true" : "false");
>      if (can_cache >= 0)
>        fprintf (fp, "\t\"%s\": %s,\n",
>                "can_cache", can_cache ? "true" : "false");

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
libguestfs lets you edit virtual machines.  Supports shell scripting,
bindings from many languages.  http://libguestfs.org

