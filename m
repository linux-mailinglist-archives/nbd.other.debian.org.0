Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 598E5898461
	for <lists+nbd@lfdr.de>; Thu,  4 Apr 2024 11:47:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 34928204E5; Thu,  4 Apr 2024 09:47:45 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Apr  4 09:47:45 2024
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C3CB4205BA
	for <lists-other-nbd@bendel.debian.org>; Thu,  4 Apr 2024 09:47:33 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.221 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
	RCVD_IN_MSPIKE_WL=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id k-y3eIl4GIr4 for <lists-other-nbd@bendel.debian.org>;
	Thu,  4 Apr 2024 09:47:26 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id CDF64205B7
	for <nbd@other.debian.org>; Thu,  4 Apr 2024 09:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712224040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cv5djRzxXwx1EVfzpRDVBs3r8GSWO1UiZliAxgQMe+A=;
	b=MJC846pvlVfmXAJU6a4SYSuqnSfDT3rttYGeWKYP8fUlHy0ldETP+KlJtZhniicK3z0cB2
	gsB1Y/MqmOmPo34/aIOX+gUY0XCLO6Y+OsPy532jHNqdcQGrOinqxfexboDcxs3ct+M2k0
	qQdExQQPPoqd5ulZDq3pe/6ImFyFJI8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-ph-s01UFOWq3Pgtfy4dBlw-1; Thu, 04 Apr 2024 05:47:16 -0400
X-MC-Unique: ph-s01UFOWq3Pgtfy4dBlw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 752BE101A520;
	Thu,  4 Apr 2024 09:47:16 +0000 (UTC)
Received: from localhost (unknown [10.42.28.11])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 120952166B33;
	Thu,  4 Apr 2024 09:47:15 +0000 (UTC)
Date: Thu, 4 Apr 2024 10:47:11 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	qemu-devel@nongnu.org,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	qemu-block@nongnu.org, nbd@other.debian.org
Subject: Re: [PATCH for-9.1 6/9] block/nbd: Use URI parsing code from glib
Message-ID: <20240404094711.GJ7912@redhat.com>
References: <20240328140607.2433889-1-thuth@redhat.com>
 <20240328140607.2433889-7-thuth@redhat.com>
 <20240328141342.GK7636@redhat.com>
 <jhweyusyjhha5hvffrtkwvuce35fajiy73dymgjre3jkjcjk7v@lrgdiintwb6i>
 <20240328164010.GM7636@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328164010.GM7636@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <As9RsHXd4d.A.JRD.AdnDmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2786
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240404094711.GJ7912@redhat.com
Resent-Date: Thu,  4 Apr 2024 09:47:45 +0000 (UTC)

On Thu, Mar 28, 2024 at 04:40:10PM +0000, Richard W.M. Jones wrote:
> libnbd absolutely does *not* get this right, eg:
> 
>   $ nbdinfo NBD://localhost
>   nbdinfo: nbd_connect_uri: unknown NBD URI scheme: NBD: Invalid argument
> 
> so that's a bug too.

Proposed fix:
https://gitlab.com/nbdkit/libnbd/-/merge_requests/6

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top

