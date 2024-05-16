Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF828C745E
	for <lists+nbd@lfdr.de>; Thu, 16 May 2024 12:06:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 146BC20602; Thu, 16 May 2024 10:06:23 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 16 10:06:22 2024
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 05D25205F4
	for <lists-other-nbd@bendel.debian.org>; Thu, 16 May 2024 10:06:10 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.328 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-1.23, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id m-OI7fxtKUsc for <lists-other-nbd@bendel.debian.org>;
	Thu, 16 May 2024 10:06:05 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id A9757205DD
	for <nbd@other.debian.org>; Thu, 16 May 2024 10:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715853960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RnZtoyp0aAJl+Ne6Xb0Np+HnPxL9schYNf6iTUBg+S4=;
	b=UJxMWjn2vg6NggS9uPRQ8oUunC+iwBJ41ovtdghGQW3Vw6ZtbI4czGH/z98Y+h8uqjAL5b
	C/AjV2EueRorCo7KkoTVa5ckoWRsGQedTGsP83V8i51+NqDtCBw61WErTpcJMwvm8u+fGa
	CJYswD4VmujLB14NFHTGMRg1CCy7LiY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-gG2XS0PANR-5dOGgLGTuMA-1; Thu, 16 May 2024 05:58:58 -0400
X-MC-Unique: gG2XS0PANR-5dOGgLGTuMA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9D568008AD;
	Thu, 16 May 2024 09:58:58 +0000 (UTC)
Received: from localhost (unknown [10.42.28.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 79021491034;
	Thu, 16 May 2024 09:58:58 +0000 (UTC)
Date: Thu, 16 May 2024 10:58:57 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Lars Rohwedder <roker@pep-project.org>
Cc: nbd@other.debian.org
Subject: Re: Updating the NBD assignment at IANA
Message-ID: <20240516095857.GB28819@redhat.com>
References: <Zij-Wnsu2F7_HwMZ@pc220518.home.grep.be>
 <0c695746-eca2-459f-88b9-0238449578c8@pep-project.org>
MIME-Version: 1.0
In-Reply-To: <0c695746-eca2-459f-88b9-0238449578c8@pep-project.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <WhbmJij52aE.A.xh.eqdRmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2812
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240516095857.GB28819@redhat.com
Resent-Date: Thu, 16 May 2024 10:06:23 +0000 (UTC)

On Wed, Apr 24, 2024 at 03:37:22PM +0200, Lars Rohwedder wrote:
> 
> >- For the "Assignee", I would like to ask them to mention this
> >   mailinglist.
> >   […]
> >- I'll leave the contact as is for now. RFC6335 mentions "The Contact
> >   person is the responsible person for the Internet community to send
> >   questions to.  This person is also authorized to submit changes on
> >   behalf of the Assignee; in cases of conflict between the Assignee and
> >   the Contact, the Assignee decisions take precedence," which to me
> >   reads like a person is required (and I'm happy to continue filling
> >   this role).
> That means: The "Assignee" (the ML) has precedence over decisions
> made by the "Contact" (you).
> 
> 🤔
> 
> >- For the description, I would like to drop the "Linux" part in the
> >   description. There are implementations of NBD that are wholly
> >   unrelated to Linux, and so I don't think it's entirely accurate
> >   anymore to refer to NBD as a "Linux" protocol.
> 
> ACK.
> 
> I am curious: Are there other OS (BSD flavours?) that uses NBD at
> the client side? If yes, they should be mentioned in the NBD's
> readme, I'd suggest.

If you extend "OS" to include userspace implementations, then qemu,
libnbd and nbdkit work as clients and servers on the BSDs.

Rich.

> >- At the time, there was no public reference for the NBD protocol yet; I
> >   plan to add the link to proto.md on github as the official reference.
> >
> >Thoughts?
> 
> Go for it! :-)
> 
> 		Lars R.
> 




-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top

