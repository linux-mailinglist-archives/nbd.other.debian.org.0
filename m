Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AC43F0FFE
	for <lists+nbd@lfdr.de>; Thu, 19 Aug 2021 03:28:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1B781207D0; Thu, 19 Aug 2021 01:28:44 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 19 01:28:44 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D3D07207C0
	for <lists-other-nbd@bendel.debian.org>; Thu, 19 Aug 2021 01:28:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.255 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-1.474,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id CUEHM38ieM2O for <lists-other-nbd@bendel.debian.org>;
	Thu, 19 Aug 2021 01:28:30 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 7D7C32079B
	for <nbd@other.debian.org>; Thu, 19 Aug 2021 01:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629336505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8irzsraGRuoohlTcleaqDm1ht54foZN4Q0/qF+jDZ6I=;
	b=e1HLSloOZIaH4ozWYg+k1EJPT+1OXXe8rIPBbY2Q2akLBcE/3hepY4J8Pzysem6ioVyQ0v
	KwawpKBBIzSeHhgoju7V97bASmmWs0l3elZaFFTyIdctLOF0Ck58ijAKH8a9UFCYIN0ibt
	0Vz/wCTdCfsHH1qXRoTGDg/vqi0u6Ig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-BxjmFgxbPg63IPupiG3Zdw-1; Wed, 18 Aug 2021 21:28:20 -0400
X-MC-Unique: BxjmFgxbPg63IPupiG3Zdw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73419100806C
	for <nbd@other.debian.org>; Thu, 19 Aug 2021 01:28:19 +0000 (UTC)
Received: from redhat.com (ovpn-114-146.phx2.redhat.com [10.3.114.146])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19D3319C87;
	Thu, 19 Aug 2021 01:28:15 +0000 (UTC)
Date: Wed, 18 Aug 2021 20:28:13 -0500
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: nbd@other.debian.org
Subject: Re: [nbdkit PATCH] server: CVE-2021-???? reset structured replies on
 starttls
Message-ID: <20210819012813.j2hhsswdr4wnref4@redhat.com>
References: <20210816185046.70131-1-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210816185046.70131-1-eblake@redhat.com>
User-Agent: NeoMutt/20210205-732-28786f
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <hA2zfrTNMXH.A.GoF.MPbHhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1303
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210819012813.j2hhsswdr4wnref4@redhat.com
Resent-Date: Thu, 19 Aug 2021 01:28:44 +0000 (UTC)

On Mon, Aug 16, 2021 at 01:50:46PM -0500, Eric Blake wrote:
> https://nostarttls.secvuln.info/ pointed out a common implementation
> flaw in various SMTP and IMAP servers with regards to improperly
> caching plaintext state across the STARTTLS encryption boundary.  It
> turns out that nbdkit has the same vulnerability in regards to the NBD
> protocol: an attacker is able to inject a plaintext
> NBD_OPT_STRUCTURED_REPLY before proxying everything else a client
> sends to the server; if the server then acts on that plaintext request
> (as nbdkit did before this patch), then the server ends up sending
> structured replies to at least NBD_CMD_READ, even though the client
> was not expecting them.  The NBD spec has been recently tightened to
> declare the nbdkit behavior to be a security hole.
> 
> ---
> 
> [NB: I'm still in the process of getting a CVE assigned; there is no
> embargo since the issue is already public, but I may wait to apply
> this patch until the commit message can be tweaked]
> ---
>  server/protocol-handshake-newstyle.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/server/protocol-handshake-newstyle.c b/server/protocol-handshake-newstyle.c
> index a2c89c9a..7e6b7b1b 100644
> --- a/server/protocol-handshake-newstyle.c
> +++ b/server/protocol-handshake-newstyle.c
> @@ -495,7 +495,8 @@ negotiate_handshake_newstyle_options (void)
>            return -1;
>          conn->using_tls = true;
>          debug ("using TLS on this connection");
> -        /* Wipe out any cached default export name. */
> +        /* Wipe out any cached state. */
> +        conn->structured_replies = false;
>          for_each_backend (b) {
>            free (conn->default_exportname[b->i]);
>            conn->default_exportname[b->i] = NULL;

While backporting this patch, I found one more piece of state that
nbdkit accidentally preserved across STARTTLS:
conn->meta_context_base_allocation.  Fortunately, this one does not
change the protocol the server speaks to a compliant client: since a
client should never use NBD_CMD_BLOCK_STATUS unless it first used
NBD_OPT_SET_META_CONTEXT beforehand, an injection of SET_META_CONTEXT
by MitM will either never be noticed (the client doesn't want to use
block status) or will be overwritten (when the client itself
negotiates meta context after the encryption is set up).  Thus, while
related to the CVE, it is not in the same category as the
STRUCTURED_REPLY injection (where a completely compliant client still
gets unexpected traffic from the server).  I'll go ahead and patch it
upstream, and backport it as well.  But it missed the 1.27.7, 1.26.5,
and 1.24.6 releases, yet I don't see it as a show-stopper worth
cutting another release.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

