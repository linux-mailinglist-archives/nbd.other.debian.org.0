Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E27F6B2FC5
	for <lists+nbd@lfdr.de>; Thu,  9 Mar 2023 22:46:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id EFA9F20673; Thu,  9 Mar 2023 21:46:46 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar  9 21:46:46 2023
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8D7692066D
	for <lists-other-nbd@bendel.debian.org>; Thu,  9 Mar 2023 21:46:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.082 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id qtqv2oIz-L0r for <lists-other-nbd@bendel.debian.org>;
	Thu,  9 Mar 2023 21:46:27 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 3AABB20619
	for <nbd@other.debian.org>; Thu,  9 Mar 2023 21:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678398382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lLEbkZdI3yAx+PfMRxv8MrjRJxrrPCYqn7glRRjVHPs=;
	b=SjV5HxTNBB3wP5TBASeg6D6DmmLDYWc3P5Ypdq9hd2DW0wz/mHAwArEEsVceRTS6eIbU0a
	szQ0kBb/JMZ4KFT9L38ZTJz5eAb2OeE1tIVSSQhdkBUArzvKRZMwVl8tsdvKRlE+jGsX1P
	VEKrEKvZnXyPZPQlLy5gvtejaLWeWPo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-cnoNOYb_OVCkT7RX57d51Q-1; Thu, 09 Mar 2023 16:46:20 -0500
X-MC-Unique: cnoNOYb_OVCkT7RX57d51Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED841100F90D
	for <nbd@other.debian.org>; Thu,  9 Mar 2023 21:46:19 +0000 (UTC)
Received: from localhost (unknown [10.39.192.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B414AC15BA0;
	Thu,  9 Mar 2023 21:46:19 +0000 (UTC)
Date: Thu, 9 Mar 2023 21:46:19 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org
Subject: Re: [PATCH v2 1/3] docs: Prefer 'cookie' over 'handle'
Message-ID: <20230309214619.GI7636@redhat.com>
References: <20230309210623.2238671-1-eblake@redhat.com>
 <20230309210623.2238671-2-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230309210623.2238671-2-eblake@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <3iBEAvavGRC.A.WjC.GPlCkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2365
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230309214619.GI7636@redhat.com
Resent-Date: Thu,  9 Mar 2023 21:46:46 +0000 (UTC)

On Thu, Mar 09, 2023 at 03:06:21PM -0600, Eric Blake wrote:
> In libnbd, we quickly learned that distinguishing between 'handle'
> (verb for acting on an object) and 'handle' (noun describing which
> object to act on) could get confusing; we solved it by renaming the
> latter to 'cookie'.  Copy that approach into the NBD spec, and make it
> obvious that a cookie is opaque data from the point of view of the
> server.  Makes no difference to implementations (other than older code
> still using 'handle' may be slightly harder to tie back to the spec).
> 
> Suggested-by: Richard W.M. Jones <rjones@redhat.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>

> ---
> v2: Add sentence mentioning historical use of 'handle'.
> ---
>  doc/proto.md | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/doc/proto.md b/doc/proto.md
> index 3a96703..b308479 100644
> --- a/doc/proto.md
> +++ b/doc/proto.md
> @@ -301,13 +301,15 @@ may be handled by the server asynchronously), and structured reply
>  chunks from one request may be interleaved with reply messages from
>  other requests; however, there may be constraints that prevent
>  arbitrary reordering of structured reply chunks within a given reply.
> -Clients SHOULD use a handle that is distinct from all other currently
> -pending transactions, but MAY reuse handles that are no longer in
> -flight; handles need not be consecutive.  In each reply message
> +Clients SHOULD use a cookie that is distinct from all other currently
> +pending transactions, but MAY reuse cookies that are no longer in
> +flight; cookies need not be consecutive.  In each reply message
>  (whether simple or structured), the server MUST use the same value for
> -handle as was sent by the client in the corresponding request.  In
> -this way, the client can correlate which request is receiving a
> -response.
> +cookie as was sent by the client in the corresponding request,
> +treating the cookie as an opaque field.  In this way, the client can
> +correlate which request is receiving a response.  Note that earlier
> +versions of this specification referred to a client's cookie as a
> +handle.
> 
>  #### Ordering of messages and writes
> 
> @@ -349,7 +351,7 @@ The request message, sent by the client, looks as follows:
>  C: 32 bits, 0x25609513, magic (`NBD_REQUEST_MAGIC`)  
>  C: 16 bits, command flags  
>  C: 16 bits, type  
> -C: 64 bits, handle  
> +C: 64 bits, cookie  
>  C: 64 bits, offset (unsigned)  
>  C: 32 bits, length (unsigned)  
>  C: (*length* bytes of data if the request is of type `NBD_CMD_WRITE`)  
> @@ -366,7 +368,7 @@ follows:
>  S: 32 bits, 0x67446698, magic (`NBD_SIMPLE_REPLY_MAGIC`; used to be
>     `NBD_REPLY_MAGIC`)  
>  S: 32 bits, error (MAY be zero)  
> -S: 64 bits, handle  
> +S: 64 bits, cookie  
>  S: (*length* bytes of data if the request is of type `NBD_CMD_READ` and
>      *error* is zero)  
> 
> @@ -381,7 +383,7 @@ server must initiate a hard disconnect).  Second, there is no way to
>  efficiently skip over portions of a sparse file that are known to
>  contain all zeroes.  Finally, it is not possible to reliably decode
>  the server traffic without also having context of what pending read
> -requests were sent by the client, to see which *handle* values will
> +requests were sent by the client, to see which *cookie* values will
>  have accompanying payload on success.  Therefore structured replies
>  are also permitted if negotiated.
> 
> @@ -398,7 +400,7 @@ sending errors via a structured reply, as the error can then be
>  accompanied by a string payload to present to a human user.
> 
>  A structured reply MAY occupy multiple structured chunk messages
> -(all with the same value for "handle"), and the
> +(all with the same value for "cookie"), and the
>  `NBD_REPLY_FLAG_DONE` reply flag is used to identify the final
>  chunk.  Unless further documented by individual requests below,
>  the chunks MAY be sent in any order, except that the chunk with
> @@ -418,7 +420,7 @@ A structured reply chunk message looks as follows:
>  S: 32 bits, 0x668e33ef, magic (`NBD_STRUCTURED_REPLY_MAGIC`)  
>  S: 16 bits, flags  
>  S: 16 bits, type  
> -S: 64 bits, handle  
> +S: 64 bits, cookie  
>  S: 32 bits, length of payload (unsigned)  
>  S: *length* bytes of payload data (if *length* is nonzero)  
> 
> -- 
> 2.39.2

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top

