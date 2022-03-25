Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBEF4E7A99
	for <lists+nbd@lfdr.de>; Fri, 25 Mar 2022 21:05:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B51182039C; Fri, 25 Mar 2022 20:05:16 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Mar 25 20:05:16 2022
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,PHONENUMBER,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 31FC620389
	for <lists-other-nbd@bendel.debian.org>; Fri, 25 Mar 2022 20:05:08 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.105 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-1.517,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, PHONENUMBER=1.5, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id FdH_UsXI9aiq for <lists-other-nbd@bendel.debian.org>;
	Fri, 25 Mar 2022 20:05:02 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 6BFD82012C
	for <nbd@other.debian.org>; Fri, 25 Mar 2022 20:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648238697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/8RJq4o7JpcwfMN8+bLaFfb7DCnsE5RuocECF7LiDNc=;
	b=JmHW76RKr9LcP1wda3Mdp5yfMwxvuwKiait6qWRsm+GL1JVbDQv1XOlV3avdWyXjF8CbWJ
	FO31wUslDjkQEibKGjd0+S3Fi9nZMsYatCmFDjR5TjtiHoVLbO+P/kMBW/yMywCmL9gsyo
	2E/oDv9pTpJkvvI6PQYlYzOnm+aJEJc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-BrvnbYRwMGuqDebjTPtSyw-1; Fri, 25 Mar 2022 16:04:55 -0400
X-MC-Unique: BrvnbYRwMGuqDebjTPtSyw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83F4A1C06915;
	Fri, 25 Mar 2022 20:04:55 +0000 (UTC)
Received: from localhost (unknown [10.39.192.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B207E112132C;
	Fri, 25 Mar 2022 20:04:42 +0000 (UTC)
Date: Fri, 25 Mar 2022 20:04:42 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, v.sementsov-og@mail.ru, libguestfs@redhat.com,
	qemu-block@nongnu.org
Subject: Re: [Libguestfs] [PATCH v2 3/3] spec: Clarify BLOCK_STATUS reply
 details
Message-ID: <20220325200442.GU8021@redhat.com>
References: <20220325124102.921017-1-eblake@redhat.com>
 <20220325124102.921017-4-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220325124102.921017-4-eblake@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <0RhVZ1IXxmP.A.OkB.8BiPiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1811
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220325200442.GU8021@redhat.com
Resent-Date: Fri, 25 Mar 2022 20:05:16 +0000 (UTC)

On Fri, Mar 25, 2022 at 07:41:02AM -0500, Eric Blake wrote:
> Our docs were inconsistent on whether a NBD_REPLY_TYPE_BLOCK_STATUS
> reply chunk can exceed the client's requested length, and silent on
> whether the lengths must be consistent whem multiple contexts were

"when"

> negotiated.  Clarify this to match existing practice as implemented in
> qemu-nbd.  Clean up some nearby grammatical errors while at it.
> ---
>  doc/proto.md | 38 ++++++++++++++++++++++++--------------
>  1 file changed, 24 insertions(+), 14 deletions(-)
> 
> diff --git a/doc/proto.md b/doc/proto.md
> index 8a817d2..8276201 100644
> --- a/doc/proto.md
> +++ b/doc/proto.md
> @@ -882,15 +882,22 @@ The procedure works as follows:
>    server supports.
>  - During transmission, a client can then indicate interest in metadata
>    for a given region by way of the `NBD_CMD_BLOCK_STATUS` command,
> -  where *offset* and *length* indicate the area of interest. The
> -  server MUST then respond with the requested information, for all
> -  contexts which were selected during negotiation. For every metadata
> -  context, the server sends one set of extent chunks, where the sizes
> -  of the extents MUST be less than or equal to the length as specified
> -  in the request. Each extent comes with a *flags* field, the
> -  semantics of which are defined by the metadata context.
> -- A server MUST reply to `NBD_CMD_BLOCK_STATUS` with a structured
> -  reply of type `NBD_REPLY_TYPE_BLOCK_STATUS`.
> +  where *offset* and *length* indicate the area of interest. On
> +  success, the server MUST respond with one structured reply chunk of
> +  type `NBD_REPLY_TYPE_BLOCK_STATUS` per metadata context selected
> +  during negotiation, where each reply chunk is a list of one or more
> +  extents for that context.
> +
> +The client's requested *length* is only a hint to the server, so the
> +cumulative size of the extents in each chunk of the server's reply may
> +be shorter or longer the original request; and when more than one

^ than the original request

> +metadata context was negotiated, the cumulative length per context may

Why is the word "cumulative" here?

> +differ within a single block status request.  Each extent comes with a
> +*flags* field, the semantics of which are defined by the metadata
> +context.  The client may use the `NBD_CMD_FLAG_REQ_ONE` flag to
> +further constrains the server's reply so that each chunk contains
> +exactly one extent whose length does not exceed the client's original
> +*length*.

In these two adjacent sentences you talk about the flags field for
each extent (which is really the type of the extent), and then the
client request flags, and it's kind of confusing.  Maybe make that a
bit clearer, eg. "In the request, the client may set the
NBD_CMD_FLAG_REQ_ONE flag ...".

>  A client MUST NOT use `NBD_CMD_BLOCK_STATUS` unless it selected a
>  nonzero number of metadata contexts during negotiation, and used the
> @@ -1778,8 +1785,8 @@ MUST initiate a hard disconnect.
>    *length* MUST be 4 + (a positive integer multiple of 8).  This reply
>    represents a series of consecutive block descriptors where the sum
>    of the length fields within the descriptors is subject to further
> -  constraints documented below. This chunk type MUST appear
> -  exactly once per metadata ID in a structured reply.
> +  constraints documented below.  A successful block status request MUST
> +  have exactly one status chunk per negotiated metadata context ID.
> 
>    The payload starts with:
> 
> @@ -1801,15 +1808,18 @@ MUST initiate a hard disconnect.
>    *length* of the final extent MAY result in a sum larger than the
>    original requested length, if the server has that information anyway
>    as a side effect of reporting the status of the requested region.
> +  When multiple metadata contexts are negotiated, the cumulative
> +  lengths in each chunk reply need not be identical.

Again, I'm unclear what is "cumulative" about the lengths.

>    Even if the client did not use the `NBD_CMD_FLAG_REQ_ONE` flag in
>    its request, the server MAY return fewer descriptors in the reply
>    than would be required to fully specify the whole range of requested
>    information to the client, if looking up the information would be
>    too resource-intensive for the server, so long as at least one
> -  extent is returned. Servers should however be aware that most
> -  clients implementations will then simply ask for the next extent
> -  instead.
> +  extent is returned.  Servers should however be aware that most
> +  client implementations will likely follow up with a request for
> +  extent information at the first offset not covered by a
> +  reduced-length reply.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
nbdkit - Flexible, fast NBD server with plugins
https://gitlab.com/nbdkit/nbdkit

