Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 210313F08AD
	for <lists+nbd@lfdr.de>; Wed, 18 Aug 2021 18:03:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 069C320406; Wed, 18 Aug 2021 16:03:17 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug 18 16:03:16 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FUZZY_OFFERS,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EBA99203F7
	for <lists-other-nbd@bendel.debian.org>; Wed, 18 Aug 2021 16:03:07 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-9.255 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-1.474, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id SEQ3ihiD4j41 for <lists-other-nbd@bendel.debian.org>;
	Wed, 18 Aug 2021 16:03:05 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 10D12203EE
	for <nbd@other.debian.org>; Wed, 18 Aug 2021 16:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629302579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sePak1ckQyhCOHHuf4yAFIyDlKSfNv07oZRXvPfWmxI=;
	b=RVilE13TfJUMB3eRpojw5UJY4oxD2qNgvQqjNiyjeYbCsABkvDJ/W3ITCH7OFGjRr4J12M
	PdLsmUIoLqh/+C6LCW7GMv1b7aAa8m4G/vAI4ANs2tGxDPpTNkPzP0+qBOkPI9Ee3hN3Gm
	AJjYzYFOkdWzRSLiznJ/W612Ecn7R84=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-Cxk61YNxO6Ssm3dTBh_mRA-1; Wed, 18 Aug 2021 12:02:56 -0400
X-MC-Unique: Cxk61YNxO6Ssm3dTBh_mRA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F409B8397F1;
	Wed, 18 Aug 2021 16:02:54 +0000 (UTC)
Received: from redhat.com (ovpn-114-146.phx2.redhat.com [10.3.114.146])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EE2419D9D;
	Wed, 18 Aug 2021 16:02:49 +0000 (UTC)
Date: Wed, 18 Aug 2021 11:02:48 -0500
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org, libguestfs@redhat.com, qemu-block@nongnu.org,
	berrange@redhat.com
Subject: Re: [PATCH] docs: Link to protocol security considerations in uri
 docs
Message-ID: <20210818160248.pz2i6n2oolp7hpwv@redhat.com>
References: <20210810180859.2100611-1-eblake@redhat.com>
 <20210812143924.sliiwlp6nhxlzy34@redhat.com>
 <YRqDTsGF5/5nKQto@pc181009.grep.be>
MIME-Version: 1.0
In-Reply-To: <YRqDTsGF5/5nKQto@pc181009.grep.be>
User-Agent: NeoMutt/20210205-719-68949a
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <V5a9OpOUEgH.A.VXE.E9SHhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1301
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210818160248.pz2i6n2oolp7hpwv@redhat.com
Resent-Date: Wed, 18 Aug 2021 16:03:17 +0000 (UTC)

On Mon, Aug 16, 2021 at 05:25:02PM +0200, Wouter Verhelst wrote:
> > As a followup, I got this reply from Hanno Böck on oss-security:
> > 
> > https://www.openwall.com/lists/oss-security/2021/08/11/8
> > | The buffering vulnerabilities we found are in STARTTLS implementations
> > | that have the expectation to enforce a secure connection, but suffer
> > | from various vulnerabilities in the implementation.
> > 
> > One of the reasons that SMTP and IMAP were particularly problematic in
> > implementations is that they are line-based protocols, with
> > arbitrary-sized packets where the length isn't known until the \n is
> > reached.  Both clients and servers have to choose whether to read one
> > character at a time (painfully slow) or read ahead into a buffer and
> > then processing what is in the buffer.  Many of the CVEs raised were
> > in regards to mishandling such buffers, such as acting on
> > previously-buffered plaintext even after the switch to encryption.
> > 
> > Thankfully, the NBD protocol has a much more structured handshake
> > (while different NBD_OPT commands can have different payload lenghts,
> > at least the header of each packet designates the length in advance,
> > reducing the need for read-ahead buffering), as well as documentation
> > that the NBD_OPT_ phase is a lockstep algorithm (neither client nor
> > server should be building up a buffer of more than one
> > command/response).
> > 
> > Another aspect of the SMTP/IMAP security holes came from incorrectly
> > carrying state across the transition to encryption (making a false
> > assumption that the answer made in plaintext will be the same when
> > encrypted).  Unfortunately, I have realized that the NBD spec has one
> > bit of state (NBD_OPT_SET_META_CONTEXT) where it is currently silent
> > on how to handle that state across a transition to encrypted.  So I
> > plan on posting a followup patch that matches the actual
> > implementation of nbdkit in opportunistic mode (qemu-nbd does not
> > offer opportunistic mode, and nbd-server does not suport
> > NBD_OPT_SET_META_CONTEXT): a server in opportunistic mode MUST treat
> > the NBD_OPT_STARTTLS command as wiping out any earlier
> > NBD_OPT_SET_META_CONTEXT.
> 
> This all makes sense, thanks.

Dan Berrangé and I thought about some more potential future problems:
right now, even with FORCEDTLS mode (in both client and server), we
have NO way to validate that the initial NBD_FLAG_[C_] bits advertised
between client and server were not tampered with by a MitM during the
plaintext portion of the exchange.  The flags field is 16 bits sent
from the server, and 16 bits mirrored back by the client, to determine
which protocol features will be in use the remainder of the
connection.  Right now, exactly two of those bits are defined:

NBD_FLAG_FIXED_NEWSTYLE - the spec is clear that NBD_OPT_STARTTLS
should not be sent unless this bit was negotiated.  Thus, both client
and server will be sending the bit set, and absence of the bit will be
evidence of a MitM attempting a downgrade attack, and there's nothing
further to worry about in the protocol.  Once STARTTLS is executed, we
already know this capability was available, so we don't need a way to
re-verify it while encrypted.

NBD_FLAG_NO_ZEROES - this bit controls how the server will respond to
NBD_OPT_EXPORT_NAME.  A mismatch between this bit (whether the MitM
strips or adds the bit) will only be observable if the client uses
NBD_OPT_EXPORT_NAME, but all clients that use STARTTLS are already
encouraged to use NBD_OPT_GO.  We may want to tighten the security
portion of the spec to make this recommendation even stronger (that
is, any client that wants to ensure there is no MitM downgrade attack
MUST use NBD_OPT_GO rather than NBD_OPT_EXPORT_NAME; and all servers
that support TLS MUST support NBD_OPT_GO), but once a client uses the
modern export selection code, we no longer care about mismatches in
this bit, and therefore we don't need a way to re-verify it while
encrypted.

However, I'm also worried about future extensions.  For example, we
have been considering the addition of a way for clients to make 64-bit
requests (basically, allowing NBD_OPT_WRITE_ZEROES to become a
single-transaction bulk-zero for an export larger than 4G).  If the
way this extension is haggled between client and server utilizes only
a new NBD_FLAG_*, then we have introduced a potential security hole,
because we are back in the situation of having a MitM flip bits prior
to STARTTLS so that client and server do not agree on which protocol
changes to use.  We can avoid this by adding a way to validate which
capability bits are actually common between client and server via a
new NBD_OPT_ sent after STARTTLS.  But rather than needing a way to
re-verify which flags are common, it is just as easy to merely declare
that ALL future protocol extensions will be haggled via NBD_OPT_ in
the first place (and not by adding new NBD_FLAG_ bits).  That way,
there will be no further places in the NBD protocol where a MitM
plaintext injection can interfere with what the client and server use
to talk to one another post-encryption.

Is it worth formalizing this decision into the NBD spec, so that we
remember down the road that adding new NBD_FLAG_ bits is an inherent
security risk thanks to the presence of STARTTLS?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

