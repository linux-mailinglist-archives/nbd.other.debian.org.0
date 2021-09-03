Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 403473FFFE7
	for <lists+nbd@lfdr.de>; Fri,  3 Sep 2021 14:40:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D172220B74; Fri,  3 Sep 2021 12:40:05 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Sep  3 12:40:05 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1741B20B71
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Sep 2021 12:39:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.528 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.747, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id FNxZZnICEcT1 for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Sep 2021 12:39:53 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 29D2220B6B
	for <nbd@other.debian.org>; Fri,  3 Sep 2021 12:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630672787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0U+odzGYgGtmFy1GLobdYHt59U7uMPUpnHZELPvWpAo=;
	b=cpx/j2z0CPuarJ+SEvStIAgoZmW9cl6uF9RocVwvHhHX94qVUNEjGNeHkNS5KG3D6Y+3tG
	aLS+tZapMFPVNn8PwwFVAkNlmt1/xzPubCkYYTz0r160793kklPY88oAUhopKu/Z5Pj1B/
	zR32bsXbRpzEmiVQdu9i0hR8bs9BUII=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-Fml5H725OCqrV0kJoMhsJA-1; Fri, 03 Sep 2021 08:39:45 -0400
X-MC-Unique: Fml5H725OCqrV0kJoMhsJA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 868696D252;
	Fri,  3 Sep 2021 12:39:44 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.phx2.redhat.com [10.3.113.81])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 64D6B60BF1;
	Fri,  3 Sep 2021 12:39:40 +0000 (UTC)
Date: Fri, 3 Sep 2021 07:39:38 -0500
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: libguestfs@redhat.com, qemu-block@nongnu.org
Subject: Re: [PATCH] spec: Relax NBD_OPT_LIST_META_CONTEXTS
Message-ID: <20210903123938.kkyh2o72pkrqlnua@redhat.com>
References: <20210816184059.69709-1-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210816184059.69709-1-eblake@redhat.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <bSHo--sjMOL.A.YEE.lehMhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1371
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210903123938.kkyh2o72pkrqlnua@redhat.com
Resent-Date: Fri,  3 Sep 2021 12:40:05 +0000 (UTC)

Ping.

On Mon, Aug 16, 2021 at 01:40:59PM -0500, Eric Blake wrote:
> Using OPT_SET_META_CONTEXTS is stateful (it is documented to wipe out
> any previously-requested contexts, and we just tightened the spec to
> clarify that starting TLS also wipes it out).  But
> OPT_LIST_META_CONTEXTS is not stateful; and in fact, with a
> SELECTIVETLS server, it can be handy to list the meta contexts
> available on an unencrypted export, then enable encryption, and then
> further list what contexts are available on encrypted exports (as the
> server is permitted to let them differ).  Thus, while a wise client
> will renegotiate structured replies after the starttls, there's no
> reason to forbid a server from answering a client that uses
> list_meta_contexts prior to encryption without also requesting
> structured replies.

I originally wrote this patch prior to the point where we decided that
OPT_STARTTLS should also wipe the effects of OPT_STRUCTURED_REPLY;
given that change in the meantime, I'm tweaking that last sentence:

Although such a client must negotiate structured replies after
starttls if it is going to actually connect to an export, this change
permits the client to shorten the handshake by two commands if it is
only being used to list available exports and their meta contexts.

> ---
>  doc/proto.md | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/doc/proto.md b/doc/proto.md
> index 9dd59da..1586d7d 100644
> --- a/doc/proto.md
> +++ b/doc/proto.md
> @@ -1325,9 +1325,9 @@ of the newstyle negotiation.
>      Return a list of `NBD_REP_META_CONTEXT` replies, one per context,
>      followed by an `NBD_REP_ACK` or an error.
> 
> -    This option MUST NOT be requested unless structured replies have
> +    This option SHOULD NOT be requested unless structured replies have
>      been negotiated first. If a client attempts to do so, a server
> -    SHOULD send `NBD_REP_ERR_INVALID`.
> +    MAY send `NBD_REP_ERR_INVALID`.
> 
>      Data:
>      - 32 bits, length of export name.  
> -- 
> 2.31.1
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

