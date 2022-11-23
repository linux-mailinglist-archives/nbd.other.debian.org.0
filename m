Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B25BB636A8F
	for <lists+nbd@lfdr.de>; Wed, 23 Nov 2022 21:10:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9A4602052E; Wed, 23 Nov 2022 20:10:03 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Nov 23 20:10:03 2022
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
	by bendel.debian.org (Postfix) with ESMTP id BB06A2051D
	for <lists-other-nbd@bendel.debian.org>; Wed, 23 Nov 2022 20:09:52 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.696 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.515, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id I7N_30KnOBUj for <lists-other-nbd@bendel.debian.org>;
	Wed, 23 Nov 2022 20:09:45 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 16C7120522
	for <nbd@other.debian.org>; Wed, 23 Nov 2022 20:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669234179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EIwgCVQdeabpDgky2yWDiED//TZuFkW5esnwk4q0RfU=;
	b=TjKuDh6r9LOodBdk5Adsk+JzSOq5t3tTWrRtkt1l2uJ5sn9Ew70O2z5MqxyocXmiqdOykb
	AVKLf3QZxreQbEHmdscn+wde4Yf11bKH7+FhOr2Uv0MuQo43dfRMtB3YQaYP7MfKra/unH
	FF//1YeM0+wF7UJPlKlnemzTSUAsbAk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-eEgxoCpvO7S99hJI1A2GQQ-1; Wed, 23 Nov 2022 15:09:37 -0500
X-MC-Unique: eEgxoCpvO7S99hJI1A2GQQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34ECE1012463;
	Wed, 23 Nov 2022 20:09:37 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.241])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9005F17582;
	Wed, 23 Nov 2022 20:09:36 +0000 (UTC)
Date: Wed, 23 Nov 2022 14:09:31 -0600
From: Eric Blake <eblake@redhat.com>
To: Pavel Machek <pavel@ucw.cz>
Cc: kernel list <linux-kernel@vger.kernel.org>, josef@toxicpanda.com,
	linux-block@vger.kernel.org, nbd@other.debian.org
Subject: Re: nbd: please don't spawn 16 threads when nbd is not even in use
Message-ID: <20221123200845.cuct5euvikqksojm@redhat.com>
References: <Y3y4+QqOlF00X9ET@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3y4+QqOlF00X9ET@duo.ucw.cz>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <4YfEFLQBstL.A.WPG.b4nfjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2303
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20221123200845.cuct5euvikqksojm@redhat.com
Resent-Date: Wed, 23 Nov 2022 20:10:03 +0000 (UTC)

On Tue, Nov 22, 2022 at 12:56:41PM +0100, Pavel Machek wrote:
> Hi!
> 
> I see this... and it looks like there are 16 workqueues before nbd is
> even used. Surely there are better ways to do that?

Yes, it would be nice to create a pool of workers that only spawns up
threads when actual parallel requests are made.  Are you willing to
help write the patch?


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

