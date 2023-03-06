Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 2288E6AC2DE
	for <lists+nbd@lfdr.de>; Mon,  6 Mar 2023 15:17:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E4A9C205F1; Mon,  6 Mar 2023 14:17:52 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Mar  6 14:17:52 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F20B4205C4
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Mar 2023 14:17:41 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.182 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id am6l3HuPXmqE for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Mar 2023 14:17:34 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 1E37D20724
	for <nbd@other.debian.org>; Mon,  6 Mar 2023 14:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678112248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DyuOPKh2Bq34hG0jMjChg3fRiwToZodpXKp9azqgshw=;
	b=Si6e1X7/OiRdVYOi7uNewoYrgurd+5CHdvUqkTkpxQcIRlzN6PRUobD2t7XOK3ZxjynLjI
	zV9CNLexYzyQeC8YSpgcXFFvglH6ljBUqc9L7hpwZh63kydIeiflLj3mrC9up7VL3lvW7L
	zEJh3kAJLIYm1wDhbmysUXs8RiH01h8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-EIam_-kcPkezqUkuh6KI5g-1; Mon, 06 Mar 2023 09:17:27 -0500
X-MC-Unique: EIam_-kcPkezqUkuh6KI5g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2AB983813F23;
	Mon,  6 Mar 2023 14:17:27 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.127])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A59B440DD;
	Mon,  6 Mar 2023 14:17:26 +0000 (UTC)
Date: Mon, 6 Mar 2023 08:17:24 -0600
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: Nir Soffer <nsoffer@redhat.com>, nbd@other.debian.org,
	libguestfs@redhat.com, qemu-block@nongnu.org
Subject: Re: [Libguestfs] [PATCH] docs: Prefer 'cookie' over 'handle'
Message-ID: <20230306141724.27zbwhdvhvpkts6l@redhat.com>
References: <20230303221503.1769410-1-eblake@redhat.com>
 <CAMRbyyuN6xFNkqyCacU=PxBqwTKdPNdO6dW1FQgTpAyWHLs7uw@mail.gmail.com>
 <ZARYkkOB/sarm6vO@pc220518.home.grep.be>
MIME-Version: 1.0
In-Reply-To: <ZARYkkOB/sarm6vO@pc220518.home.grep.be>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ousgj30rbfB.A.sTG.QYfBkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2355
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230306141724.27zbwhdvhvpkts6l@redhat.com
Resent-Date: Mon,  6 Mar 2023 14:17:52 +0000 (UTC)

On Sun, Mar 05, 2023 at 10:53:38AM +0200, Wouter Verhelst wrote:
> On Sat, Mar 04, 2023 at 10:03:46PM +0200, Nir Soffer wrote:
> > On Sat, Mar 4, 2023 at 12:15 AM Eric Blake <eblake@redhat.com> wrote:
> > > Makes no difference to implementations (other than older code
> > > still using 'handle' may be slightly harder to tie back to the spec).
> > 
> > To avoid confusion with older code that carefully used "handle" to match
> > the spec, maybe add a note that "cookie" was named "handle" before?
> 
> Yes, this. I'm happy with renaming it cookie (it makes sense), but there
> is a *lot* of stuff out there that calls it "handle" (including a
> wireshark plugin) and it would be confusing if that link isn't available
> anywhere.

Sure.  v2 will include patches to nbd code as well.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

