Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9923EDCC4
	for <lists+nbd@lfdr.de>; Mon, 16 Aug 2021 20:03:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 222B620641; Mon, 16 Aug 2021 18:03:23 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug 16 18:03:23 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7242D2059D
	for <lists-other-nbd@bendel.debian.org>; Mon, 16 Aug 2021 18:03:15 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-9.255 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-1.474, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id VScoqYckDqSO for <lists-other-nbd@bendel.debian.org>;
	Mon, 16 Aug 2021 18:03:10 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 9EB4E2059E
	for <nbd@other.debian.org>; Mon, 16 Aug 2021 18:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629136985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tWJidtpLCPu/5SUA4LDIqZIrRGPFUm4xQIO8J7mCIBQ=;
	b=F/eAcAnATjlZsPxKDLezrVPbwCI8Vy941C0HBXWzExLgzvgGCHK4UZ9aZfmiAldtDAJvrR
	CWwzDKWA/jAcuvgXaTJhL+1wwQUgJdtUEEIBXHMlkKXeM4zc/AuZMJ6cXHl4I4X4DxPu6U
	GfUIQiNrIrDOQENUhdu5dW41XFq8eVk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-xU3vaY8lPDiBkFv1spU_dA-1; Mon, 16 Aug 2021 14:03:02 -0400
X-MC-Unique: xU3vaY8lPDiBkFv1spU_dA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90CC01082921;
	Mon, 16 Aug 2021 18:03:01 +0000 (UTC)
Received: from redhat.com (ovpn-113-125.phx2.redhat.com [10.3.113.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42F1C61095;
	Mon, 16 Aug 2021 18:02:57 +0000 (UTC)
Date: Mon, 16 Aug 2021 13:02:55 -0500
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org, qemu-block@nongnu.org, libguestfs@redhat.com
Subject: Re: [PATCH] spec: Clarify STARTTLS vs. SET_META_CONTEXT interaction
Message-ID: <20210816180255.xawv3s4f6rletqcp@redhat.com>
References: <20210812152040.2752184-1-eblake@redhat.com>
 <YRqEvhxOoytetJfo@pc181009.grep.be>
MIME-Version: 1.0
In-Reply-To: <YRqEvhxOoytetJfo@pc181009.grep.be>
User-Agent: NeoMutt/20210205-719-68949a
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Qp5FC9ivn8N.A.fcH.rhqGhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1294
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210816180255.xawv3s4f6rletqcp@redhat.com
Resent-Date: Mon, 16 Aug 2021 18:03:23 +0000 (UTC)

On Mon, Aug 16, 2021 at 05:31:10PM +0200, Wouter Verhelst wrote:

> > +++ b/doc/proto.md
> > @@ -1165,6 +1165,14 @@ of the newstyle negotiation.
> >      permitted by this document (for example, `NBD_REP_ERR_INVALID` if
> >      the client included data).
> > 
> > +    When this command succeeds, the server MUST NOT preserve any
> > +    per-export state (such as metadata contexts from
> > +    `NBD_OPT_SET_META_CONTEXT`) issued before this command.  The
> > +    server MAY preserve global state such as a client request for
> > +    `NBD_OPT_STRUCTURED_REPLY`; however, a client SHOULD defer other
> > +    stateful option requests until after it determines whether
> > +    encryption is available.
> 
> I'm not sure I think that makes sense. It's safer to require that
> STARTTLS wipes out everything.
> 
> There are two reasonable ways of communicating with a server that
> supports opportunistic TLS: either you enable TLS as soon as possible
> after opening the connection (and then you should do any state
> modification after the STARTTLS command), or you don't do any STARTTLS
> at all, ever (and then all state settings are done in the unencrypted
> connection). Anything else seems like a silly idea.

Concur.

> 
> As such, I think trying to support ways in which you configure things
> before STARTTLS, then do STARTTLS, and then expect things to retain
> state, is bound to invite security issues, and we should not even try to
> support it.

Okay, how about this wording:

+When this command succeeds, the server MUST NOT preserve any
+negotiation state (such as a request for `NBD_OPT_STRUCTURED_REPLY`,
+or metadata contexts from `NBD_OPT_SET_META_CONTEXT`) issued before
+this command.  A client SHOULD defer all stateful option requests
+until after it determines whether encryption is available.

Unfortunately, nbdkit in opportunistic mode does not (yet) obey that:
a request for structured replies prior to starttls is currently
preserved across the jump into encryption - which may result in the
server sending structured replies to a client not expecting them due
to a MitM plaintext injection.  I'll be submitting a patch for that
soon; sounds like we found a CVE in nbdkit.

On the other hand, qemu as NBD client always sends NBD_OPT_STARTTLS
first (disconnecting rather than falling back to plaintext).  libnbd
as NBD client does not (yet) expose any way to attempt starttls after
other negotiation commands: in opportunistic mode, it currently probes
for encryption before giving the user any control over other NBD_OPT_
commands.  At one point, I had the idea of expanding the libnbd API to
make it easier to try even NBD_OPT_STARTTLS under user control (which
would make it easier to test issues like how servers behave with
clients that don't lead off with STARTTLS), but that has not been
implemented yet, so at the moment, we don't have clients in the wild
that were relying on nbdkit's stateful behavior.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

