Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 096F1727B97
	for <lists+nbd@lfdr.de>; Thu,  8 Jun 2023 11:38:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E2867204D9; Thu,  8 Jun 2023 09:38:26 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun  8 09:38:26 2023
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 06BDB204D7
	for <lists-other-nbd@bendel.debian.org>; Thu,  8 Jun 2023 09:38:16 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.191 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id JdGdbWV_gftZ for <lists-other-nbd@bendel.debian.org>;
	Thu,  8 Jun 2023 09:38:08 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id E1501204D6
	for <nbd@other.debian.org>; Thu,  8 Jun 2023 09:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686217083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YkIuZfYD5RQL8x2nGnOMXQFQ1OKIvhM2WHyGSvp3du4=;
	b=VozCjXXkO1FJJjm01OMdcVsXwU6jVcKAyDomA2TQm6EOv09aO8OiesT3bfRt/s7NS7qtsM
	5Vx2p3gcdEw+c3QIEQakH7CtryoxAix5nvfxQXHwPccw3OVV5lQe7mRHQlA+SNTZaBSZrX
	Hs4uulytjA2pAf6U8YGiQO6tm7tUHrU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-b9cAQs_iMPaxgMNQK5uYbQ-1; Thu, 08 Jun 2023 05:38:00 -0400
X-MC-Unique: b9cAQs_iMPaxgMNQK5uYbQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CBC029AA38B;
	Thu,  8 Jun 2023 09:38:00 +0000 (UTC)
Received: from localhost (unknown [10.39.192.206])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5929DC1603B;
	Thu,  8 Jun 2023 09:38:00 +0000 (UTC)
Date: Thu, 8 Jun 2023 10:37:59 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: libguestfs@redhat.com, qemu-block@nongnu.org, nbd@other.debian.org
Subject: Re: [libnbd PATCH v3 17/22] ocaml: Add example for 64-bit extents
Message-ID: <20230608093759.GN7773@redhat.com>
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-18-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230525130108.757242-18-eblake@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <pOc4PC0YKzK.A.t5F.SGagkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2536
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230608093759.GN7773@redhat.com
Resent-Date: Thu,  8 Jun 2023 09:38:26 +0000 (UTC)

On Thu, May 25, 2023 at 08:01:03AM -0500, Eric Blake wrote:
> Since our example program for 32-bit extents is inherently limited to
> 32-bit lengths, it is also worth demonstrating the 64-bit extent API,
> including the difference in the array indexing being saner.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  ocaml/examples/Makefile.am  |  1 +
>  ocaml/examples/extents64.ml | 42 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 43 insertions(+)
>  create mode 100644 ocaml/examples/extents64.ml
> 
> diff --git a/ocaml/examples/Makefile.am b/ocaml/examples/Makefile.am
> index 28b4ab94..a4eb47a5 100644
> --- a/ocaml/examples/Makefile.am
> +++ b/ocaml/examples/Makefile.am
> @@ -20,6 +20,7 @@ include $(top_srcdir)/subdir-rules.mk
>  ml_examples = \
>  	asynch_copy.ml \
>  	extents.ml \
> +	extents64.ml \
>  	get_size.ml \
>  	open_qcow2.ml \
>  	server_flags.ml \
> diff --git a/ocaml/examples/extents64.ml b/ocaml/examples/extents64.ml
> new file mode 100644
> index 00000000..8ee7e218
> --- /dev/null
> +++ b/ocaml/examples/extents64.ml
> @@ -0,0 +1,42 @@
> +open Printf
> +
> +let () =
> +  NBD.with_handle (
> +    fun nbd ->
> +      NBD.add_meta_context nbd "base:allocation";
> +      NBD.connect_command nbd
> +                          ["nbdkit"; "-s"; "--exit-with-parent"; "-r";
> +                           "sparse-random"; "8G"];
> +
> +      (* Read the extents and print them. *)
> +      let size = NBD.get_size nbd in
> +      let cap =
> +        match NBD.get_extended_headers_negotiated nbd with
> +        | true -> size
> +        | false -> 0x8000_0000_L in
> +      let fetch_offset = ref 0_L in
> +      while !fetch_offset < size do
> +        let remaining = Int64.sub size !fetch_offset in
> +        let fetch_size = min remaining cap in
> +        NBD.block_status_64 nbd fetch_size !fetch_offset (
> +          fun meta _ entries err ->
> +            printf "nbd_block_status callback: meta=%s err=%d\n" meta !err;
> +            if meta = "base:allocation" then (
> +              printf "index\t%16s %16s %s\n" "offset" "length" "flags";
> +              for i = 0 to Array.length entries - 1 do
> +                let len = fst entries.(i)
> +                and flags =
> +                  match snd entries.(i) with
> +                  | 0_L -> "data"
> +                  | 1_L -> "hole"
> +                  | 2_L -> "zero"
> +                  | 3_L -> "hole+zero"
> +                  | unknown -> sprintf "unknown (%Ld)" unknown in
> +                printf "%d:\t%16Ld %16Ld %s\n" i !fetch_offset len flags;
> +                fetch_offset := Int64.add !fetch_offset len
> +              done;
> +            );
> +            0
> +        ) (* NBD.block_status *)
> +      done
> +  )

Yes, the API is nicer now we return the subelements as a list instead
of having to iterate over the list in pairs.  I might change that to
an array or struct after these patches go upstream as that will be a
tiny bit more efficient.

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top

