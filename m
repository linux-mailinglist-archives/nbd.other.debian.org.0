Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 614A44F1350
	for <lists+nbd@lfdr.de>; Mon,  4 Apr 2022 12:50:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 28E0E209B3; Mon,  4 Apr 2022 10:50:30 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Apr  4 10:50:30 2022
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,PHONENUMBER,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F2CEF209AA
	for <lists-other-nbd@bendel.debian.org>; Mon,  4 Apr 2022 10:50:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.289 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, PHONENUMBER=1.5, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id fR2utHJRvYP2 for <lists-other-nbd@bendel.debian.org>;
	Mon,  4 Apr 2022 10:50:15 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id C8F6E209A9
	for <nbd@other.debian.org>; Mon,  4 Apr 2022 10:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649069409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=foKuOuRuNTGg5CNZbCxbXTeLl8m1hHlRLmEjlWOZqbQ=;
	b=PuDU2neQuKRLWusOW7E+5UCPSysw1yLb0A782qAU2Yh+yP0kJAMubIlAc9obXP6HQY8Taz
	tFQQdy/WZj+COFeHA3nQxqH2gpTu4roxABw7lnHX2ovBi9oz5KZv1UG0HRjNTc2CD6zMWd
	AqXdtiJRVo0WLsW1tK5rzLPM6TVBzWM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-zvO0463IM9-EVW9FuMFb7w-1; Mon, 04 Apr 2022 06:48:57 -0400
X-MC-Unique: zvO0463IM9-EVW9FuMFb7w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CA7780005D;
	Mon,  4 Apr 2022 10:48:56 +0000 (UTC)
Received: from localhost (unknown [10.39.192.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DA69F568EC;
	Mon,  4 Apr 2022 10:48:46 +0000 (UTC)
Date: Mon, 4 Apr 2022 11:48:46 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, libguestfs@redhat.com, qemu-block@nongnu.org,
	v.sementsov-og@mail.ru
Subject: Re: [PATCH v3] spec: Clarify BLOCK_STATUS reply details
Message-ID: <20220404104846.GH1127@redhat.com>
References: <20220401210807.1515492-1-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220401210807.1515492-1-eblake@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <tGIGkkqplKJ.A.S_G.21sSiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1849
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220404104846.GH1127@redhat.com
Resent-Date: Mon,  4 Apr 2022 10:50:30 +0000 (UTC)

On Fri, Apr 01, 2022 at 04:08:07PM -0500, Eric Blake wrote:
> Our docs were inconsistent on whether a NBD_REPLY_TYPE_BLOCK_STATUS
> reply chunk can exceed the client's requested length, and silent on
> whether the lengths must be consistent when multiple contexts were
> negotiated.  Clarify this to match existing practice as implemented in
> qemu-nbd.  Clean up some nearby grammatical errors while at it.
> ---
> 
> Another round of rewording attempts, based on feedback from Rich on
> v2.  I went ahead and pushed patch 1 and 2 of the v2 series, as they
> were less controversial.
> 
>  doc/proto.md | 42 ++++++++++++++++++++++++++++--------------
>  1 file changed, 28 insertions(+), 14 deletions(-)
> 
> diff --git a/doc/proto.md b/doc/proto.md
> index 8a817d2..bacccfa 100644
> --- a/doc/proto.md
> +++ b/doc/proto.md
> @@ -882,15 +882,25 @@ The procedure works as follows:
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
> +  consecutive extents for that context.  Each extent comes with a
> +  *flags* field, the semantics of which are defined by the metadata
> +  context.
> +
> +The client's requested *length* is only a hint to the server, so the
> +cumulative extent length contained in a chunk of the server's reply
> +may be shorter or longer the original request.  When more than one
> +metadata context was negotiated, the reply chunks for the different
> +contexts of a single block status request need not have the same
> +number of extents or cumulative extent length.
> +
> +In the request, the client may use the `NBD_CMD_FLAG_REQ_ONE` command
> +flag to further constrain the server's reply so that each chunk
> +contains exactly one extent whose length does not exceed the client's
> +original *length*.
> 
>  A client MUST NOT use `NBD_CMD_BLOCK_STATUS` unless it selected a
>  nonzero number of metadata contexts during negotiation, and used the
> @@ -1778,8 +1788,8 @@ MUST initiate a hard disconnect.
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
> @@ -1801,15 +1811,19 @@ MUST initiate a hard disconnect.
>    *length* of the final extent MAY result in a sum larger than the
>    original requested length, if the server has that information anyway
>    as a side effect of reporting the status of the requested region.
> +  When multiple metadata contexts are negotiated, the reply chunks for
> +  the different contexts need not have the same number of extents or
> +  cumulative extent length.
> 
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
> 
>  All error chunk types have bit 15 set, and begin with the same
>  *error*, *message length*, and optional *message* fields as

This seems clearer now, thanks.

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v

