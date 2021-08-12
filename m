Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECE73EA6AA
	for <lists+nbd@lfdr.de>; Thu, 12 Aug 2021 16:39:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 85F9C203AC; Thu, 12 Aug 2021 14:39:56 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 12 14:39:56 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FUZZY_OFFERS,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,URIBL_RED autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id AB85C203A3
	for <lists-other-nbd@bendel.debian.org>; Thu, 12 Aug 2021 14:39:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-9.254 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-1.474, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001, URIBL_RED=0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id FTae-bGEnrqJ for <lists-other-nbd@bendel.debian.org>;
	Thu, 12 Aug 2021 14:39:40 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 30B942026A
	for <nbd@other.debian.org>; Thu, 12 Aug 2021 14:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628779175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/jK7DVQaF1+xrWfx9Q8732XaGKji2Mry7o1c6+4SeV8=;
	b=aMOeNShdbKemXUoFdVqkkj0rGpK/ru+rnHASkfVSwPHteF1Q0yoV88gliaaztTOJ5qyNBK
	kzVRWLzdRxWy1W+9dkajo1IfBdpqxIkJNa08ePhyBINJm5QmtrN3PCVUGHuBpENtJQcNKX
	TXpkGTbXzz84/2SGGGU7mAU/N/G3phw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-_AhUmAspO3G7Q7CnT-Z0MA-1; Thu, 12 Aug 2021 10:39:31 -0400
X-MC-Unique: _AhUmAspO3G7Q7CnT-Z0MA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BDAC801B3C;
	Thu, 12 Aug 2021 14:39:30 +0000 (UTC)
Received: from redhat.com (ovpn-112-138.phx2.redhat.com [10.3.112.138])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 245435D9DE;
	Thu, 12 Aug 2021 14:39:26 +0000 (UTC)
Date: Thu, 12 Aug 2021 09:39:24 -0500
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: libguestfs@redhat.com, qemu-block@nongnu.org
Subject: Re: [PATCH] docs: Link to protocol security considerations in uri
 docs
Message-ID: <20210812143924.sliiwlp6nhxlzy34@redhat.com>
References: <20210810180859.2100611-1-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210810180859.2100611-1-eblake@redhat.com>
User-Agent: NeoMutt/20210205-687-0ed190
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <XKk5B59kY5G.A.yL.8KTFhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1276
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210812143924.sliiwlp6nhxlzy34@redhat.com
Resent-Date: Thu, 12 Aug 2021 14:39:56 +0000 (UTC)

On Tue, Aug 10, 2021 at 01:08:59PM -0500, Eric Blake wrote:
> Especially useful in light of the recent publishing of
> https://nostarttls.secvuln.info/, which documents a variety of
> implementations vulnerable to downgrade attacks in SMTP and IMAP, as
> well as its caution that that any protocol with a STARTTLS operation
> (which includes NBD) needs to be aware of the potential downgrade
> attacks.
> 
> The NBD protocol documentation already covers what is necessary to
> avoid the effects of a downgrade attack, and all known implementations
> of NBD servers and clients with working NBD_OPT_STARTTLS have at least
> one mode where TLS is mandatory rather than opportunistic.  So I don't
> see this as a CVE against the NBD protocol itself, so much as a worry
> about the potential for future poor implementations that disregard the
> documentation.
> ---
> 
> I'm likely to push this to the NBD spec later this week if it doesn't
> receive any reviews beforehand.

As a followup, I got this reply from Hanno Böck on oss-security:

https://www.openwall.com/lists/oss-security/2021/08/11/8
| The buffering vulnerabilities we found are in STARTTLS implementations
| that have the expectation to enforce a secure connection, but suffer
| from various vulnerabilities in the implementation.

One of the reasons that SMTP and IMAP were particularly problematic in
implementations is that they are line-based protocols, with
arbitrary-sized packets where the length isn't known until the \n is
reached.  Both clients and servers have to choose whether to read one
character at a time (painfully slow) or read ahead into a buffer and
then processing what is in the buffer.  Many of the CVEs raised were
in regards to mishandling such buffers, such as acting on
previously-buffered plaintext even after the switch to encryption.

Thankfully, the NBD protocol has a much more structured handshake
(while different NBD_OPT commands can have different payload lenghts,
at least the header of each packet designates the length in advance,
reducing the need for read-ahead buffering), as well as documentation
that the NBD_OPT_ phase is a lockstep algorithm (neither client nor
server should be building up a buffer of more than one
command/response).

Another aspect of the SMTP/IMAP security holes came from incorrectly
carrying state across the transition to encryption (making a false
assumption that the answer made in plaintext will be the same when
encrypted).  Unfortunately, I have realized that the NBD spec has one
bit of state (NBD_OPT_SET_META_CONTEXT) where it is currently silent
on how to handle that state across a transition to encrypted.  So I
plan on posting a followup patch that matches the actual
implementation of nbdkit in opportunistic mode (qemu-nbd does not
offer opportunistic mode, and nbd-server does not suport
NBD_OPT_SET_META_CONTEXT): a server in opportunistic mode MUST treat
the NBD_OPT_STARTTLS command as wiping out any earlier
NBD_OPT_SET_META_CONTEXT.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

