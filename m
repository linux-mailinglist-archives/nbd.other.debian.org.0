Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCD93EDF87
	for <lists+nbd@lfdr.de>; Mon, 16 Aug 2021 23:55:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B4191205F7; Mon, 16 Aug 2021 21:55:47 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug 16 21:55:47 2021
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RAZOR2_CF_RANGE_51_100,
	RAZOR2_CHECK,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 91B3B2061A
	for <lists-other-nbd@bendel.debian.org>; Mon, 16 Aug 2021 21:55:38 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.255 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-1.474,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RAZOR2_CF_RANGE_51_100=4, RAZOR2_CHECK=1,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 9eEhJGgnhrAD for <lists-other-nbd@bendel.debian.org>;
	Mon, 16 Aug 2021 21:55:33 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
X-Greylist: delayed 378 seconds by postgrey-1.36 at bendel; Mon, 16 Aug 2021 21:55:33 UTC
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id A6D25205DF
	for <nbd@other.debian.org>; Mon, 16 Aug 2021 21:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629150928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D0Gb3R15wts26zvcZLlyAppVVjW6SN5aVp4IsQj6TDs=;
	b=RycqCV/nPkAPEpgepJrOXFl5E/yCzDbJkHxdcpIr3akasTN9C0cmbR+2Gq2Kd6YxuHoyRz
	ZuwYEJca691vw6JJxcBCzhKCrE/cNx4XiRSlOznq+MjSBjc8cYp4lSORW24V3SkGX/n6F1
	jF2tOkrrcXbOfkXx8ZYr47Wg0TcGkFI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-FwrGIbkZMfCwjFRN8c3leA-1; Mon, 16 Aug 2021 17:49:07 -0400
X-MC-Unique: FwrGIbkZMfCwjFRN8c3leA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBE6E1936B61
	for <nbd@other.debian.org>; Mon, 16 Aug 2021 21:49:06 +0000 (UTC)
Received: from localhost (unknown [10.39.193.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0CFEC19C87;
	Mon, 16 Aug 2021 21:49:02 +0000 (UTC)
Date: Mon, 16 Aug 2021 22:49:02 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: libguestfs@redhat.com, nbd@other.debian.org
Subject: Re: [nbdkit PATCH] server: CVE-2021-???? reset structured replies on
 starttls
Message-ID: <20210816214902.GA3730@redhat.com>
References: <20210816185046.70131-1-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210816185046.70131-1-eblake@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <EwavN5XIGOL.A.wrC.j7tGhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1299
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210816214902.GA3730@redhat.com
Resent-Date: Mon, 16 Aug 2021 21:55:47 +0000 (UTC)

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

It's be good to either reference the nostarttls website, or
the relevant section in NBD proto.md (if it's upstream yet)
in the comment.

But yes - ACK.

Thanks,

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW

