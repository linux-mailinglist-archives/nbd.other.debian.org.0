Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id EF78124397E
	for <lists+nbd@lfdr.de>; Thu, 13 Aug 2020 13:55:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CBCD4203B0; Thu, 13 Aug 2020 11:55:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 13 11:55:20 2020
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 432AC203A6
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Aug 2020 11:55:13 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.099 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id fXxRYj_cfJW7 for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Aug 2020 11:55:08 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 HELO_IP_IN_CL_SUBNET=-1.2 (check from: .redhat. - helo: .us-smtp-1.mimecast. - helo-domain: .mimecast.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -4.7
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by bendel.debian.org (Postfix) with ESMTP id 9165C20392
	for <nbd@other.debian.org>; Thu, 13 Aug 2020 11:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597319702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=G4vmodytbRkwBmZ4RatMwp3HDdsKn7k3Ucx0KzVshVY=;
	b=PJ1I+0n7lWVlo2jlbD+I2CGgrgXSMK225ODcaKqA5BtT9qw4LwZo9c47bvG2mqVq7Hn4w+
	HCi4OtHuPv7V+8lK0lDphuV/IEcfR1LKMKXZnfc2m3HDVPj4CNqLNFSIvPVU26HvQi4exJ
	IVYROv9DvYH2pwjlVeYb1/KlT47xQl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-uB3eIxo2NZqjgqdpU7nUWg-1; Thu, 13 Aug 2020 07:53:42 -0400
X-MC-Unique: uB3eIxo2NZqjgqdpU7nUWg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 020CD1DDE0
	for <nbd@other.debian.org>; Thu, 13 Aug 2020 11:53:42 +0000 (UTC)
Received: from localhost (ovpn-114-99.ams2.redhat.com [10.36.114.99])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A149B19C78;
	Thu, 13 Aug 2020 11:53:41 +0000 (UTC)
Date: Thu, 13 Aug 2020 12:53:40 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: nbd@other.debian.org
Cc: eblake@redhat.com
Subject: Client UUID
Message-ID: <20200813115340.GA12188@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <fCU57AXUgCG.A.fX.ooSNfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/930
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200813115340.GA12188@redhat.com
Resent-Date: Thu, 13 Aug 2020 11:55:20 +0000 (UTC)

This is just an idea for a possible future revision of the protocol.

It would be nice if clients could send a unique UUID.  The client
would choose this randomly when they start up and send it as an NBD
option.  If a client makes multiple connections (ie. multi-conn) then
they would send the same UUID on each TCP connection.  Of course this
is entirely optional and clients would not need to send a UUID.

The use for me would be allow nbdkit-tmpdisk-plugin
(https://libguestfs.org/nbdkit-tmpdisk-plugin.1.html) to support
multi-conn and therefore higher performance.  At the moment because
this plugin serves different content on each connection, multi-conn
cannot be used -- indeed is gravely unsafe to use.  With a client UUID
we could associate clients uniquely with the temporary disks and thus
support multi-conn.  Every other proposal I can think of (eg. going
off IP address) runs into difficulties.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top

