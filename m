Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E994E7A8E
	for <lists+nbd@lfdr.de>; Fri, 25 Mar 2022 20:59:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DDA5A20443; Fri, 25 Mar 2022 19:59:27 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Mar 25 19:59:27 2022
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9E9B420426
	for <lists-other-nbd@bendel.debian.org>; Fri, 25 Mar 2022 19:59:19 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.605 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-1.517,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ZpFwp05T1bLl for <lists-other-nbd@bendel.debian.org>;
	Fri, 25 Mar 2022 19:59:16 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 7625F20425
	for <nbd@other.debian.org>; Fri, 25 Mar 2022 19:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648238351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EEcrNJ8hUxOQnNHaCjrXZh5WKMHxSkERFZfknGSgq5M=;
	b=NRLRqvecWsrlDCBLaWGbSES85lO3RcyJ7dTPUiQsr5z2Rtbgh6hG1Wa2tOrcwWv2xtxtF/
	ABGsa1/LljLJeu485pJaQi1ZAoltvFae+zC8O+OFJBjTaCzcrjvuJ9dhik3WyMAWWGOuDU
	3tz8RO5M0kveY15Il31xLHANVxe6Plo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-9MoPQx2ZNmiEOCci8grxZg-1; Fri, 25 Mar 2022 15:59:05 -0400
X-MC-Unique: 9MoPQx2ZNmiEOCci8grxZg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4474F811E78;
	Fri, 25 Mar 2022 19:59:05 +0000 (UTC)
Received: from localhost (unknown [10.39.192.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 061ACC27E83;
	Fri, 25 Mar 2022 19:59:04 +0000 (UTC)
Date: Fri, 25 Mar 2022 19:59:04 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, v.sementsov-og@mail.ru, libguestfs@redhat.com,
	qemu-block@nongnu.org
Subject: Re: [PATCH v2 2/3] docs: Clarify structured reads vs. block size
 constraints
Message-ID: <20220325195904.GT8021@redhat.com>
References: <20220325124102.921017-1-eblake@redhat.com>
 <20220325124102.921017-3-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220325124102.921017-3-eblake@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <T_069UfiRzE.A.YvH.f8hPiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1810
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220325195904.GT8021@redhat.com
Resent-Date: Fri, 25 Mar 2022 19:59:27 +0000 (UTC)

On Fri, Mar 25, 2022 at 07:41:01AM -0500, Eric Blake wrote:
> The text for structured reads mentioned a mandatory split of certain
> large reads, without also mentioning that large reads are generally
> not possible when block constraints are in play.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  doc/proto.md | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/doc/proto.md b/doc/proto.md
> index bfebb5a..8a817d2 100644
> --- a/doc/proto.md
> +++ b/doc/proto.md
> @@ -1911,13 +1911,14 @@ The following request types exist:
>      chunks that describe data outside the offset and length of the
>      request, but MAY send the content chunks in any order (the client
>      MUST reassemble content chunks into the correct order), and MAY
> -    send additional content chunks even after reporting an error chunk.
> -    Note that a request for more than 2^32 - 8 bytes MUST be split
> -    into at least two chunks, so as not to overflow the length field
> -    of a reply while still allowing space for the offset of each
> -    chunk.  When no error is detected, the server MUST send enough
> -    data chunks to cover the entire region described by the offset and
> -    length of the client's request.
> +    send additional content chunks even after reporting an error
> +    chunk.  Note that a request for more than 2^32 - 8 bytes (if
> +    permitted by block size constraints) MUST be split into at least

The actual change is just the "(if ... constraints)" subclause.
The rest is formatting.

> +    two chunks, so as not to overflow the length field of a reply
> +    while still allowing space for the offset of each chunk.  When no
> +    error is detected, the server MUST send enough data chunks to
> +    cover the entire region described by the offset and length of the
> +    client's request.
> 
>      To minimize traffic, the server MAY use a content or error chunk
>      as the final chunk by setting the `NBD_REPLY_FLAG_DONE` flag, but

ACK

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
libguestfs lets you edit virtual machines.  Supports shell scripting,
bindings from many languages.  http://libguestfs.org

