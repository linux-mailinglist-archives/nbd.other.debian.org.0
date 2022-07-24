Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E21C457F4D0
	for <lists+nbd@lfdr.de>; Sun, 24 Jul 2022 13:24:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C1DF7204EA; Sun, 24 Jul 2022 11:24:01 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Jul 24 11:24:01 2022
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 98849204E3
	for <lists-other-nbd@bendel.debian.org>; Sun, 24 Jul 2022 11:23:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.21 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id eZXB02shRcKr for <lists-other-nbd@bendel.debian.org>;
	Sun, 24 Jul 2022 11:23:50 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 58B26204DD
	for <nbd@other.debian.org>; Sun, 24 Jul 2022 11:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=GF5LVS13QXBMwJDwZWaR9BsCg+18/J7+vdaORtqy/hM=; b=WVaKaI3jCBY2eTvTQfbjJGjhMm
	LE0BHSnXNyzmsTAMMxgoAJHcBshB09PSOIPW0G7iD9J2DfEVnTKlPproZ5FVjekpG1hMNG3jac7Uf
	l9/dEh/biSwZ+mZIPAW1VveqTn1TqAeJlq10ULwhyt8YjRN4bfA7t/Fjt4YZvganhu22GGFUUgRa0
	F8Gi3opBbY7JywTuSRyxsRp+O80tHxZakGcwNRhovo1+d+MAsflbg572BoAzLk4o6ZvE9n7+18tp3
	Fleu6gCoQlhRvbBsLQ7ubeo9dayF4AeofbpuY3Ds9T6vIr7MEpSMY7plJHTEAVknh+SmYmjjQSySE
	Nc7yXs9Q==;
Received: from [102.39.138.29] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1oFZi6-00GepL-UO; Sun, 24 Jul 2022 13:23:46 +0200
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1oFZhz-0002k9-2g;
	Sun, 24 Jul 2022 13:23:39 +0200
Date: Sun, 24 Jul 2022 13:23:39 +0200
From: Wouter Verhelst <w@uter.be>
To: Turakar <turakar23@gmail.com>
Cc: nbd@other.debian.org
Subject: Re: Setup NBD with TLS
Message-ID: <Yt0ru9B4fSraI90p@pc220518.home.grep.be>
References: <618b6ab5-e275-6573-e00d-aa62019089bb@gmail.com>
 <0540e6c2-57c0-5c06-08e8-69be5b350201@gmail.com>
 <abab8c6e-1bba-8d89-3cde-cda678d785a7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abab8c6e-1bba-8d89-3cde-cda678d785a7@gmail.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ik06m_k1hK.A.iiH.RvS3iB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2202
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Yt0ru9B4fSraI90p@pc220518.home.grep.be
Resent-Date: Sun, 24 Jul 2022 11:24:01 +0000 (UTC)

Glad to hear everything is sorted.

Could you clarify how you managed to fix it in the end? I'm trying to
figure out which part of the documentation is unclear, so we can clarify
that for future users.

On Wed, Jul 20, 2022 at 11:37:45AM +0200, Turakar wrote:
>    Following the guide of nbdkit everything worked out.
> 
>    [1]https://libguestfs.org/nbdkit-tls.1.html
> 
>    On 16/07/2022 22:29, Turakar wrote:
> 
>    An addition: A similar error occurs if only use encryption and no
>    authentication:
> 
>    $ nbd-client localhost /dev/nbd1 -N export -n -x
>    Negotiation: ..Error: Read failed: Connection reset by peer
>    E: received invalid negotiation magic 11567081237618425856 (expected
>    1100100111001001)
> 
>    On 16/07/2022 14:40, Turakar wrote:
> 
>    Hello,
> 
>    I am currently trying to setup nbd-server/nbd-client with TLS
>    authentication, but I ran into some difficult error messages. If this
>    is the wrong list for support, please feel free to redirect me.
> 
>    I use one system (Debian 10) for both nbd-server and nbd-client for
>    debugging, but want to move to separate hosts later. I used the
>    following nbd-server config file:
> 
>    [generic]
>           user = root
>           group = root
>           includedir = /etc/nbd-server/conf.d
>           allowlist = true
>    # TLS setup
>           force_tls = true
>           cacertfile = /etc/nbd-server/certificates/ca.cert.pem
>           certfile = /etc/nbd-server/certificates/server.cert.pem
>           keyfile = /etc/nbd-server/certificates/server.key.pem
>    [export]
>           exportname = /dev/system/nixos
>           flush = true
> 
>    I created the certificates as follows:
> 
>    $ openssl genrsa -des3 -out ca.key 4096
>    $ openssl req -new -x509 -days 36500 -key ca.key -out ca.cert.pem
>    $ openssl genrsa -out server.key 4096
>    $ openssl req -new -key server.key -out server.csr
>    $ openssl x509 -req -days 36500 -in server.csr -CA ca.cert.pem -CAkey
>    ca.key -CAcreateserial -out server.crt
>    $ openssl genrsa -out client.key.pem 4096
>    $ openssl req -new -key -client.key.pem -out client.csr
>    $ openssl x509 -req -in client.csr -CA ca.cert.pem -CAkey ca.key
>    -CAcreateserial -days 36500 -sha512 -out clien
>    t.cert.pem
> 
>    And use the following command for testing the connection:
> 
>    $ nbd-client -l localhost -certfile
>    /etc/nbd-server/certificates/client.cert.
>    pem -keyfile /etc/nbd-server/certificates/client.key.pem -cacertfile
>    /etc/nbd-server/certificates/ca.cert.pem -n
>    Negotiation: ..
>    Error: Reading magic from server: Connection reset by peer
>    Exiting.
> 
>    Thereby, the server log says this:
> 
>    Jul 16 14:21:28 mini systemd[1]: Started LSB: Network Block Device
>    server.
>    Jul 16 14:21:30 mini nbd_server[26099]: Spawned a child process
>    Jul 16 14:21:30 mini nbd_server[26099]: Child exited with 1
> 
>    Not that informative... Can someone of you spot the problem in my
>    configuration?
> 
>    Remarks: If I set force_tls = False and do not use the certificates
>    with nbd-client, it works fine. However, I need TLS encryption for my
>    use case.
> 
>    Thank you and kind regards,
>    Turakar
> 
> Referenties
> 
>    1. https://libguestfs.org/nbdkit-tls.1.html

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

